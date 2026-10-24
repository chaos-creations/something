/// Lines heard between two requests that are kept, older ones are dropped
#define LLM_HEARD_MAX 5
/// Longest heard line or examine text sent to the bridge
#define LLM_TEXT_MAX 300
/// Longest line the NPC is allowed to say
#define LLM_SAY_MAX 200
/// Most actions taken from one answer
#define LLM_ACTIONS_MAX 4
#define LLM_MOBS_MAX 12
#define LLM_ITEMS_MAX 10
#define LLM_OBJECTS_MAX 8
/// How far around itself the NPC lists items and objects
#define LLM_LOOK_RANGE 5

/datum/human_ai_brain
	/// If TRUE, speech heard from players goes to the LLM bridge and its answers are acted on
	var/llm_enabled = FALSE
	/// Free text character description sent with every request
	var/llm_personality = ""
	/// Identifies this brain's dialogue history on the bridge
	var/llm_brain_id
	/// list(list("speaker" = weakref, "name" = name, "text" = text)) heard since the last request
	var/list/llm_heard = list()
	/// Short id ("m1") : weakref of everything in the last observation, the only things answers may refer to
	var/list/llm_ids = list()
	/// Outcomes of the last actions (examine text, refusals), sent with the next request
	var/list/llm_results = list()
	/// If TRUE, a friendly mob spoke in the batch that led to the current answer, so movement orders are obeyed
	var/llm_orders_allowed = FALSE
	/// If TRUE, the current request was sent only to report results, so its results are not reported again
	var/llm_followup = FALSE
	var/datum/http_request/llm_request
	var/llm_request_time = 0
	var/llm_request_cooldown = 3.5 SECONDS
	COOLDOWN_DECLARE(llm_cooldown)
	/// Mob that was ordered to be followed
	var/datum/weakref/llm_follow_target
	/// Atom the current task (pick_up, give, use) walks to
	var/datum/weakref/llm_task_target
	/// Held item the current task uses
	var/datum/weakref/llm_task_item
	var/llm_task_type

/datum/human_ai_brain/proc/llm_set_enabled(enable)
	var/static/brain_count = 0
	llm_enabled = enable
	if(!llm_brain_id)
		llm_brain_id = "brain[++brain_count]"
	llm_heard.Cut()
	llm_results.Cut()
	llm_clear_orders()

/datum/human_ai_brain/proc/llm_clear_orders()
	llm_follow_target = null
	llm_clear_task()
	quick_approach = null

/datum/human_ai_brain/proc/llm_clear_task()
	llm_task_target = null
	llm_task_item = null
	llm_task_type = null

/datum/human_ai_brain/proc/llm_on_hear_say(datum/source, message, mob/speaker, datum/language/language)
	SIGNAL_HANDLER
	if(!llm_enabled || tied_human.client || tied_human.stat != CONSCIOUS)
		return
	// NPCs answering NPCs would loop and burn the budget
	if(!speaker?.client || speaker == tied_human)
		return
	if(tied_human.sdisabilities & DISABILITY_DEAF || tied_human.ear_deaf)
		return
	if(!tied_human.say_understands(speaker, language))
		return

	var/speaker_name = speaker.name
	if(ishuman(speaker))
		var/mob/living/carbon/human/human_speaker = speaker
		speaker_name = human_speaker.GetVoice()

	if(length(llm_heard) >= LLM_HEARD_MAX)
		llm_heard.Cut(1, 2)
	llm_heard += list(list(
		"speaker" = WEAKREF(speaker),
		"name" = speaker_name,
		"text" = copytext_char(html_decode(message), 1, LLM_TEXT_MAX),
	))
	llm_followup = FALSE
	SSllm_ai.queue(src)

/datum/human_ai_brain/proc/llm_persona_data()
	return list(
		"name" = tied_human.real_name || "",
		"rank" = tied_human.get_paygrade() || "",
		"job" = tied_human.job || "",
		"faction" = tied_human.faction || "",
		"personality" = llm_personality || "",
	)

/// Gives a short id to an atom for this observation, the same atom always gets the same id
/datum/human_ai_brain/proc/llm_id_for(atom/thing, prefix, list/ids_by_atom)
	if(ids_by_atom[thing])
		return ids_by_atom[thing]
	var/id = "[prefix][length(ids_by_atom) + 1]"
	ids_by_atom[thing] = id
	llm_ids[id] = WEAKREF(thing)
	return id

/datum/human_ai_brain/proc/llm_mob_row(mob/living/target, list/ids_by_atom)
	return list(
		"id" = llm_id_for(target, "m", ids_by_atom),
		"name" = target.name,
		"faction" = target.faction,
		"side" = faction_check(target) ? "friendly" : "hostile",
		"dist" = get_dist(tied_human, target),
		"state" = llm_health_state(target),
	)

/datum/human_ai_brain/proc/llm_health_state(mob/living/target)
	if(target.stat == DEAD)
		return "dead"
	if(target.stat == UNCONSCIOUS)
		return "unconscious"
	var/ratio = target.health / max(target.maxHealth, 1)
	if(ratio < 0.4)
		return "badly hurt"
	if(ratio < 0.8)
		return "hurt"
	return "fine"

/datum/human_ai_brain/proc/llm_build_observation()
	llm_ids.Cut()
	var/list/ids_by_atom = list()

	var/list/held = list()
	for(var/obj/item/hand_item in list(tied_human.l_hand, tied_human.r_hand))
		held += list(list(
			"id" = llm_id_for(hand_item, "i", ids_by_atom),
			"name" = hand_item.name,
			"active_hand" = hand_item == tied_human.get_active_hand(),
		))

	llm_orders_allowed = FALSE
	var/list/heard = list()
	for(var/list/line as anything in llm_heard)
		var/datum/weakref/speaker_ref = line["speaker"]
		var/mob/speaker = speaker_ref.resolve()
		if(speaker && faction_check(speaker))
			llm_orders_allowed = TRUE
		heard += list(list(
			"from" = speaker ? llm_id_for(speaker, "m", ids_by_atom) : null,
			"name" = line["name"],
			"text" = line["text"],
		))
	llm_heard.Cut()

	var/list/mobs = list()
	var/list/listed_mobs = list()
	for(var/mob/living/nearby in view(view_distance, tied_human))
		if(nearby == tied_human || length(mobs) >= LLM_MOBS_MAX)
			continue
		mobs += list(llm_mob_row(nearby, ids_by_atom))
		listed_mobs += nearby
	// A speaker out of view still gets a row, so the model knows who talked
	for(var/atom/thing as anything in ids_by_atom)
		if(isliving(thing) && !(thing in listed_mobs))
			mobs += list(llm_mob_row(thing, ids_by_atom))

	var/list/items = list()
	var/list/objects = list()
	for(var/obj/nearby in view(LLM_LOOK_RANGE, tied_human))
		if(!isturf(nearby.loc) || nearby.invisibility || !nearby.mouse_opacity)
			continue
		if(isitem(nearby))
			if(length(items) < LLM_ITEMS_MAX)
				items += list(list("id" = llm_id_for(nearby, "i", ids_by_atom), "name" = nearby.name, "dist" = get_dist(tied_human, nearby)))
		else if(llm_is_interesting_object(nearby) && length(objects) < LLM_OBJECTS_MAX)
			objects += list(list("id" = llm_id_for(nearby, "o", ids_by_atom), "name" = nearby.name, "dist" = get_dist(tied_human, nearby)))

	var/mob/living/follow_mob = llm_follow_target?.resolve()
	var/list/self = list(
		"state" = llm_health_state(tied_human),
		"in_combat" = in_combat,
		"holding_position" = hold_position,
		"following" = follow_mob ? llm_id_for(follow_mob, "m", ids_by_atom) : null,
		"fighting" = current_target ? llm_id_for(current_target, "m", ids_by_atom) : null,
		"task" = llm_task_type,
	)

	var/list/results = llm_results.Copy()
	llm_results.Cut()

	return list(
		"self" = self,
		"heard" = heard,
		"held" = held,
		"mobs" = mobs,
		"items" = items,
		"objects" = objects,
		"results" = results,
	)

/// Objects worth telling the model about: things you can open, operate or take from, not walls of tables and lights
/datum/human_ai_brain/proc/llm_is_interesting_object(obj/thing)
	if(istype(thing, /obj/structure/machinery))
		return !istype(thing, /obj/structure/machinery/door) && !istype(thing, /obj/structure/machinery/light) && !istype(thing, /obj/structure/machinery/camera)
	return istype(thing, /obj/structure/closet) || istype(thing, /obj/structure/largecrate) || istype(thing, /obj/structure/reagent_dispensers) || istype(thing, /obj/vehicle)

/datum/human_ai_brain/proc/llm_resolve(id)
	if(!istext(id))
		return
	var/datum/weakref/ref = llm_ids[id]
	return ref?.resolve()

/datum/human_ai_brain/proc/llm_result(action, id, text)
	llm_results += list(list("action" = action, "target" = id, "text" = copytext_char(text, 1, LLM_TEXT_MAX)))

/datum/human_ai_brain/proc/llm_on_response(datum/http_response/response)
	// rust-g reports non-2xx answers as errors too, with the status code in the text
	if(response.errored || response.status_code != 200)
		SSllm_ai.report_error("bridge request failed: [response.error || "HTTP [response.status_code]"]")
		return

	var/list/data
	try
		data = json_decode(response.body)
	catch
		SSllm_ai.report_error("bridge sent invalid JSON")
		return
	if(data["error"])
		SSllm_ai.report_error("bridge: [data["error"]]")
		return
	SSllm_ai.last_error = null

	if(!llm_enabled || QDELETED(tied_human) || tied_human.client || tied_human.stat != CONSCIOUS)
		return

	var/list/actions = data["actions"]
	if(!islist(actions))
		return
	var/done = 0
	for(var/list/action in actions)
		if(++done > LLM_ACTIONS_MAX)
			break
		var/list/action_args = islist(action["args"]) ? action["args"] : list()
		llm_execute(action["name"], action_args)

	// Examine text and refusals get one more turn so the NPC can react to them
	if(length(llm_results) && !llm_followup)
		llm_followup = TRUE
		SSllm_ai.queue(src)
	else
		llm_followup = FALSE

/// Runs one action from the bridge. Everything is checked here again: the bridge and the model are not trusted
/datum/human_ai_brain/proc/llm_execute(name, list/action_args)
	var/target_id = action_args["target"]
	var/atom/target = llm_resolve(target_id)
	var/static/list/orders = list("follow", "stop", "hold", "move_to", "pick_up", "give", "use")
	if((name in orders) && !llm_orders_allowed)
		return

	switch(name)
		if("say")
			var/text = llm_clean_text(action_args["text"])
			if(text)
				tied_human.say(text)

		if("emote")
			var/text = llm_clean_text(action_args["text"])
			// Unlike say(), emote() leaves sanitizing to the Me verb
			if(text)
				tied_human.emote("me", EMOTE_VISIBLE, strip_html(text))

		if("follow")
			if(!isliving(target) || target == tied_human || !llm_can_see(target))
				return
			llm_clear_orders()
			hold_position = FALSE
			llm_follow_target = WEAKREF(target)

		if("stop")
			llm_clear_orders()
			hold_position = FALSE

		if("hold")
			llm_clear_orders()
			hold_position = TRUE

		if("move_to")
			if(!target || !llm_can_see(target))
				return
			llm_clear_orders()
			hold_position = FALSE
			quick_approach = get_turf(target)

		if("attack")
			if(!isliving(target) || !llm_can_see(target))
				return
			if(!can_target(target))
				llm_result(name, target_id, "refused: not a valid hostile target or a friendly is in the way")
				return
			set_target(target)

		if("heal")
			if(!ishuman(target) || target == tied_human || !llm_can_see(target) || !faction_check(target))
				return
			set_injured_ally(target)

		if("examine")
			if(!target || !llm_can_see(target))
				return
			llm_result(name, target_id, llm_describe(target))

		if("pick_up")
			if(!isitem(target) || !isturf(target.loc) || !llm_can_see(target))
				return
			llm_start_task(name, target)

		if("drop")
			var/obj/item/held_item = tied_human.get_active_hand()
			if(held_item)
				tied_human.drop_held_item(held_item)

		if("give")
			var/obj/item/held_item = tied_human.get_active_hand()
			if(!held_item)
				llm_result(name, target_id, "nothing in the active hand")
				return
			if(!ishuman(target) || target == tied_human || !llm_can_see(target) || !faction_check(target))
				return
			llm_start_task(name, target, held_item)

		if("use")
			var/obj/item/use_item = llm_resolve(action_args["item"])
			if(use_item && use_item.loc != tied_human)
				return
			// Using things on mobs is left to the combat and medical AI
			if(target && (!isobj(target) || !llm_can_see(target)))
				return
			if(!target)
				if(!use_item)
					return
				if(tied_human.get_active_hand() != use_item)
					tied_human.swap_hand()
				INVOKE_ASYNC(use_item, TYPE_PROC_REF(/obj/item, attack_self), tied_human)
				return
			llm_start_task(name, target, use_item)

/datum/human_ai_brain/proc/llm_start_task(task_type, atom/target, obj/item/task_item)
	llm_clear_orders()
	hold_position = FALSE
	llm_task_type = task_type
	llm_task_target = WEAKREF(target)
	llm_task_item = task_item ? WEAKREF(task_item) : null

/// Called by /datum/ai_action/llm_task once the NPC stands next to the task target
/datum/human_ai_brain/proc/llm_finish_task()
	var/atom/target = llm_task_target?.resolve()
	var/obj/item/task_item = llm_task_item?.resolve()
	var/task_type = llm_task_type
	llm_clear_task()
	if(!target)
		return

	switch(task_type)
		if("pick_up")
			var/obj/item/pickup_item = target
			if(!isturf(pickup_item.loc))
				return
			if(tied_human.get_active_hand())
				tied_human.swap_hand()
			if(tied_human.get_active_hand())
				llm_result(task_type, null, "both hands are full")
				return
			tied_human.put_in_active_hand(pickup_item)

		if("give")
			var/mob/living/carbon/human/receiver = target
			if(!task_item || task_item.loc != tied_human || receiver.stat == DEAD)
				return
			tied_human.drop_held_item(task_item)
			if(receiver.put_in_hands(task_item))
				tied_human.visible_message(SPAN_NOTICE("[tied_human] hands [task_item] to [receiver]."), null, null, 5)

		if("use")
			if(task_item)
				if(task_item.loc != tied_human)
					return
				if(tied_human.get_active_hand() != task_item)
					tied_human.swap_hand()
			tied_human.face_atom(target)
			INVOKE_ASYNC(tied_human, TYPE_PROC_REF(/mob, do_click), target, "", list())

/datum/human_ai_brain/proc/llm_can_see(atom/target)
	return target.z == tied_human.z && (target in view(view_distance, tied_human))

/// Plain text a person would learn by looking, without the HTML and icons of get_examine_text()
/datum/human_ai_brain/proc/llm_describe(atom/target)
	var/text = "[target.name]."
	if(target.desc)
		text += " [target.desc]"
	if(isliving(target))
		text += " State: [llm_health_state(target)]."
	if(isitem(target))
		var/obj/item/target_item = target
		if(isgun(target_item))
			var/obj/item/weapon/gun/target_gun = target_item
			if(target_gun.current_mag)
				text += " Rounds: [target_gun.current_mag.current_rounds]."
	var/static/regex/tags = regex("<\[^>]*>", "g")
	return html_decode(tags.Replace(text, ""))

/// Raw model text cut to size, HTML is escaped by whatever displays it
/datum/human_ai_brain/proc/llm_clean_text(text)
	if(!istext(text))
		return
	return trim(copytext_char(sanitize_control_chars(text), 1, LLM_SAY_MAX))

#undef LLM_HEARD_MAX
#undef LLM_TEXT_MAX
#undef LLM_SAY_MAX
#undef LLM_ACTIONS_MAX
#undef LLM_MOBS_MAX
#undef LLM_ITEMS_MAX
#undef LLM_OBJECTS_MAX
#undef LLM_LOOK_RANGE

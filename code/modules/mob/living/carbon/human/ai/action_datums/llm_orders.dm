/// Follows the mob an LLM brain was told to follow, see ai_brain_llm.dm
/datum/ai_action/llm_follow
	name = "LLM Follow"
	action_flags = ACTION_USING_LEGS
	var/follow_distance = 2

/datum/ai_action/llm_follow/get_weight(datum/human_ai_brain/brain)
	if(!brain.llm_follow_target)
		return 0

	if(brain.in_cover || brain.in_combat || brain.hold_position)
		return 0

	var/mob/living/followed = brain.llm_follow_target.resolve()
	if(!followed || followed.stat == DEAD || followed.z != brain.tied_human.z)
		brain.llm_follow_target = null
		return 0

	if(get_dist(brain.tied_human, followed) <= follow_distance)
		return 0

	// Above follow_leader and patrols, below looting
	return 6

/datum/ai_action/llm_follow/trigger_action()
	. = ..()

	if(brain.in_combat)
		return ONGOING_ACTION_COMPLETED

	var/mob/living/followed = brain.llm_follow_target?.resolve()
	if(!followed)
		return ONGOING_ACTION_COMPLETED

	var/mob/tied_human = brain.tied_human
	if(get_dist(tied_human, followed) > follow_distance)
		if(!brain.move_to_next_turf(get_turf(followed)))
			return ONGOING_ACTION_COMPLETED

		if(get_dist(tied_human, followed) > follow_distance)
			return ONGOING_ACTION_UNFINISHED

	return ONGOING_ACTION_COMPLETED

/// Walks next to the target of an LLM task (move to, pick up, give, use) and does it
/datum/ai_action/llm_task
	name = "LLM Task"
	action_flags = ACTION_USING_LEGS | ACTION_USING_HANDS

/datum/ai_action/llm_task/get_weight(datum/human_ai_brain/brain)
	if(!brain.llm_task_target)
		return 0

	if(brain.in_combat || brain.hold_position)
		return 0

	if(!brain.llm_task_target.resolve())
		brain.llm_clear_task()
		return 0

	if(brain.llm_task_timed_out())
		return 0

	// Above looting: a spoken order beats picking up loot
	return 20

/datum/ai_action/llm_task/trigger_action()
	. = ..()

	if(brain.in_combat)
		return ONGOING_ACTION_COMPLETED

	var/atom/target = brain.llm_task_target?.resolve()
	if(!target)
		brain.llm_clear_task()
		return ONGOING_ACTION_COMPLETED

	if(brain.llm_task_timed_out())
		return ONGOING_ACTION_COMPLETED

	var/mob/tied_human = brain.tied_human
	if(get_dist(tied_human, target) > 1)
		if(!brain.move_to_next_turf(get_turf(target)))
			brain.llm_result(brain.llm_task_type, null, "could not get there")
			brain.llm_clear_task()
			return ONGOING_ACTION_COMPLETED

		if(get_dist(tied_human, target) > 1)
			return ONGOING_ACTION_UNFINISHED

	brain.llm_finish_task()
	return ONGOING_ACTION_COMPLETED

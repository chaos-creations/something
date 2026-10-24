/// Where the in-round bridge settings are kept between restarts
#define LLM_SETTINGS_FILE "data/llm_bridge.json"
/// A request older than this is forgotten, the bridge has its own shorter timeout
#define LLM_REQUEST_TIMEOUT (40 SECONDS)

/// Bridge address and secret, out of reach of VV and proc calls like the DB config
/datum/llm_bridge_settings
	var/url
	var/token
	/// TRUE if the values came from the server config, which then can't be changed in round
	var/from_config = FALSE

GENERAL_PROTECT_DATUM(/datum/llm_bridge_settings)

/// Sends what LLM-enabled human AI heard to tools/llm_bridge and hands the answers back to their brains
SUBSYSTEM_DEF(llm_ai)
	name = "LLM AI"
	wait = 0.5 SECONDS
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/datum/llm_bridge_settings/settings
	/// Brains that heard something and wait for their cooldown to send it
	var/list/datum/human_ai_brain/queued = list()
	/// Brains with a request in flight
	var/list/datum/human_ai_brain/pending = list()
	/// Last failure, shown in the stat panel
	var/last_error

/datum/controller/subsystem/llm_ai/Initialize()
	settings = new
	load_settings()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/llm_ai/stat_entry(msg)
	msg = "[is_configured() ? "on" : "off"] Q:[length(queued)] P:[length(pending)][last_error ? " E:[last_error]" : ""]"
	return ..()

/datum/controller/subsystem/llm_ai/proc/is_configured()
	return settings?.url && settings.token

/datum/controller/subsystem/llm_ai/proc/load_settings()
	settings.url = CONFIG_GET(string/llm_bridge_url)
	settings.token = CONFIG_GET(string/llm_bridge_token)
	if(settings.url)
		settings.from_config = TRUE
		return

	if(!fexists(LLM_SETTINGS_FILE))
		return

	var/list/saved
	try
		saved = json_decode(file2text(LLM_SETTINGS_FILE))
	catch
		log_debug("LLM AI: [LLM_SETTINGS_FILE] is not valid JSON")
		return
	settings.url = saved["url"]
	settings.token = saved["token"]

/datum/controller/subsystem/llm_ai/proc/save_settings()
	rustg_file_write(json_encode(list("url" = settings.url, "token" = settings.token)), LLM_SETTINGS_FILE)

/datum/controller/subsystem/llm_ai/proc/queue(datum/human_ai_brain/brain)
	queued |= brain

/datum/controller/subsystem/llm_ai/proc/report_error(error)
	if(error == last_error)
		return
	last_error = error
	log_debug("LLM AI: [error]")

/datum/controller/subsystem/llm_ai/fire(resumed = FALSE)
	if(!is_configured())
		queued.Cut()
		return

	for(var/datum/human_ai_brain/brain as anything in pending)
		if(QDELETED(brain) || !brain.llm_request)
			pending -= brain
			continue
		if(brain.llm_request.is_complete())
			pending -= brain
			var/datum/http_response/response = brain.llm_request.into_response()
			brain.llm_request = null
			brain.llm_on_response(response)
		else if(world.time > brain.llm_request_time + LLM_REQUEST_TIMEOUT)
			pending -= brain
			brain.llm_request = null
			report_error("request timed out")

	for(var/datum/human_ai_brain/brain as anything in queued)
		if(QDELETED(brain) || !brain.llm_enabled)
			queued -= brain
			continue
		if(brain.llm_request || !COOLDOWN_FINISHED(brain, llm_cooldown))
			continue
		queued -= brain
		send(brain)
		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/llm_ai/proc/send(datum/human_ai_brain/brain)
	if(QDELETED(brain.tied_human) || brain.tied_human.client || brain.tied_human.stat == DEAD)
		return

	var/body = json_encode(list(
		"brain_id" = brain.llm_brain_id,
		"persona" = brain.llm_persona_data(),
		"observation" = brain.llm_build_observation(),
	))
	var/datum/http_request/request = new
	request.prepare(RUSTG_HTTP_METHOD_POST, "[settings.url]/think", body, list(
		"Content-Type" = "application/json",
		"Authorization" = "Bearer [settings.token]",
	))
	request.begin_async()
	brain.llm_request = request
	brain.llm_request_time = world.time
	COOLDOWN_START(brain, llm_cooldown, brain.llm_request_cooldown)
	pending += brain

/client/proc/set_llm_bridge()
	set name = "Set LLM Bridge"
	set category = "Server"

	if(!check_rights(R_SERVER))
		return

	if(SSllm_ai.settings.from_config)
		to_chat(src, SPAN_WARNING("The LLM bridge is set in the server config (LLM_BRIDGE_URL), change it there."))
		return

	var/new_url = tgui_input_text(src, "Bridge address, for example http://127.0.0.1:8765. Empty turns LLM NPCs off.", "LLM Bridge", SSllm_ai.settings.url, encode = FALSE)
	if(isnull(new_url))
		return
	new_url = trim(new_url)
	if(!new_url)
		SSllm_ai.settings.url = null
		SSllm_ai.settings.token = null
		SSllm_ai.save_settings()
		message_admins("[key_name_admin(src)] turned the LLM bridge off.")
		return

	var/static/regex/url_regex = regex(@{"^https?://[^\s<>"']+$"})
	if(!url_regex.Find(new_url))
		to_chat(src, SPAN_WARNING("That is not an http(s) address."))
		return
	if(copytext(new_url, -1) == "/")
		new_url = copytext(new_url, 1, -1)

	var/new_token = tgui_input_text(src, "Bridge token (BRIDGE_TOKEN from the bridge env). Empty keeps the current one.", "LLM Bridge", encode = FALSE)
	if(isnull(new_token))
		return
	new_token = trim(new_token)
	var/static/regex/token_regex = regex(@"^[A-Za-z0-9_\-]{32,}$")
	if(new_token && !token_regex.Find(new_token))
		to_chat(src, SPAN_WARNING("The token must be at least 32 letters, digits, - or _."))
		return
	if(!new_token && !SSllm_ai.settings.token)
		to_chat(src, SPAN_WARNING("There is no token yet, enter one."))
		return

	SSllm_ai.settings.url = new_url
	if(new_token)
		SSllm_ai.settings.token = new_token
	SSllm_ai.last_error = null
	SSllm_ai.save_settings()
	message_admins("[key_name_admin(src)] set the LLM bridge to [new_url][new_token ? " with a new token" : ""].")

	// Checks the token too: /stats needs it, /health does not
	var/datum/http_request/request = new
	request.prepare(RUSTG_HTTP_METHOD_GET, "[new_url]/stats", "", list("Authorization" = "Bearer [SSllm_ai.settings.token]"))
	request.begin_async()
	var/give_up_time = world.time + 10 SECONDS
	while(!request.is_complete())
		if(world.time > give_up_time)
			to_chat(src, SPAN_WARNING("The bridge did not answer in 10 seconds."))
			return
		sleep(0.5 SECONDS)
	var/datum/http_response/response = request.into_response()
	// rust-g turns non-2xx answers into errors, so a wrong token shows up as "status code 401"
	if(response.errored && findtext(response.error, "401"))
		to_chat(src, SPAN_WARNING("The bridge answered, but rejected the token."))
	else if(response.errored || response.status_code != 200)
		to_chat(src, SPAN_WARNING("The bridge did not work: [html_encode(response.error || "HTTP [response.status_code]")]"))
	else
		to_chat(src, SPAN_NOTICE("The bridge works: [html_encode(response.body)]"))

/client/proc/toggle_llm_human_ai(mob/living/carbon/human/mob in GLOB.human_mob_list)
	set name = "Toggle LLM Brain"
	set desc = "Let an AI human talk and take spoken orders through the LLM bridge."
	set category = null

	if(!check_rights(R_DEBUG|R_ADMIN))
		return

	if(QDELETED(mob))
		return

	var/datum/human_ai_brain/brain = mob.get_ai_brain()
	if(!brain)
		to_chat(src, SPAN_WARNING("[mob] has no AI. Use Make AI first."))
		return

	if(brain.llm_enabled)
		brain.llm_set_enabled(FALSE)
		message_admins("[key_name_admin(src)] removed the LLM brain from [mob.real_name].")
		return

	if(!SSllm_ai.is_configured())
		to_chat(src, SPAN_WARNING("The LLM bridge is not set up yet (Server > Set LLM Bridge). The NPC will start talking once it is."))

	var/personality = tgui_input_text(src, "Who is [mob.real_name]? Character, background, manner of speech. Empty gives a plain soldier.", "LLM Brain", brain.llm_personality, max_length = 1000, multiline = TRUE, encode = FALSE)
	if(isnull(personality))
		return
	brain.llm_personality = trim(personality)
	brain.llm_set_enabled(TRUE)
	message_admins("[key_name_admin(src)] gave [mob.real_name] an LLM brain.")

#undef LLM_SETTINGS_FILE
#undef LLM_REQUEST_TIMEOUT

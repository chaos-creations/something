/mob/living/carbon/human/verb/roll_dice_ic()
	set category = "IC"
	set name = "Roll Dice"

	var/action_text = input(src, "What are you trying to do?", "Dice Roll") as text|null
	if(action_text == null)
		return

	src.roll_dice(action_text)

/mob/living/carbon/human/proc/roll_dice(action_text)
	var/result = rand(1, 18)

	// Build the messages separately
	var/msg_all = "[src] [(action_text && length(action_text)) ? "tries to [action_text] and rolls" : "rolls a dice and gets"] [result]!"
	var/msg_self = "You [(action_text && length(action_text)) ? "try to [action_text]" : "roll a dice"] and get [result]!"

	// Visible to everyone nearby
	visible_message(
		"<span class='notice'>[msg_all]</span>",
		"<span class='notice'>[msg_self]</span>"
	)

	// Log for admins
	log_admin("[src] rolled a dice: [(action_text && length(action_text)) ? action_text : "no action"] → [result]")

	// Show in admin chat with jump option
	message_admins("[src] rolled a dice: [(action_text && length(action_text)) ? action_text : "no action"] → [result] [ADMIN_JMP(src)]", 1)

	return result

//chatgpt shitcode

/obj/structure/machinery/computer/custom_email
	name = "Personal Computer"
	desc = "A personal computer used to view emails"
	icon = 'icons/obj/structures/machinery/computer.dmi'
	icon_state = "terminal1"
	var/screen = 0
	var/list/email_list = list() // EXAMPLE FOR MAPPING list(/datum/fluff_email/email1, /datum/fluff_email/email2, /datum/fluff_email/email3)
	var/selected_mail

/obj/structure/machinery/computer/custom_email/Initialize()
	. = ..()

/obj/structure/machinery/computer/custom_email/Destroy()
	QDEL_NULL_LIST(email_list)
	. = ..()

/obj/structure/machinery/computer/custom_email/attack_hand(mob/user)
	if(..())
		return

	var/dat

	switch(screen)
		if(0)
			dat += "<A href='byond://?src=\ref[src];open_inbox=1'><font size=4>Inbox</font></A><HR>"
		if(1)
			dat += "<font size=4>Inbox</font> | <A href='byond://?src=\ref[src];close_inbox=1'>Close</A><HR>"
			if(selected_mail)
				var/datum/fluff_email/E = email_list[selected_mail]
				dat += "<b>SUBJECT: [E.title]</b><HR>"
				dat += "[E.entry_text]<HR>"
				dat += "<A href='?src=\ref[src];print=1'>Print</A><BR>"
				dat += "<A href='?src=\ref[src];back=1'>Back</A>"
			else
				var/i = 0
				for(var/mail in email_list)
					i++
					var/datum/fluff_email/FE = mail
					dat += "<A href='byond://?src=\ref[src];selectmail=[i]'>[FE.title]</A><BR>"

	show_browser(user, dat, "[src.name]", "email_[REF(src)]", "size=600x520")

/obj/structure/machinery/computer/custom_email/Topic(href, href_list)
	if(..())
		return

	if(href_list["open_inbox"])
		screen = 1

	else if(href_list["close_inbox"])
		screen = 0

	else if(href_list["selectmail"])
		selected_mail = text2num(href_list["selectmail"])

	else if(href_list["back"])
		selected_mail = null

	else if(href_list["print"])
		if(selected_mail)
			var/datum/fluff_email/E = email_list[selected_mail]
			var/obj/item/paper/P = new /obj/item/paper(get_turf(src))
			P.name = "Printed Email — [E.title]"
			P.info = "<b>SUBJECT:</b> [E.title]<hr>[E.entry_text]<hr><i>Printed from terminal: [src.name]</i>"
			P.update_icon()
			playsound(src, 'sound/machines/fax.ogg', 50, 1)

	add_fingerprint(usr)
	attack_hand(usr)

/obj/structure/machinery/computer/custom_email/contracts
	name = "Misson Terminal"
	desc = "An old but reliable machine connected to the local network. The display shows a rotating list of available tasks — ranging from deliveries and repairs to escort missions and clearances. \
	The interface is simple: contract title, a brief description, estimated difficulty, and payout."
	icon_state = "overwatch"
	email_list = list(/datum/fluff_email/rover/mission1, /datum/fluff_email/rover/mission2, /datum/fluff_email/rover/mission3)

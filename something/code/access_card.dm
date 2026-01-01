/obj/structure/machinery/door_control/card
	name = "card reader"
	desc = "A small card reading device mounted into the wall. Only accepts access cards. Not dogtags, not identification cards. Access cards."
	icon = 'something/icons/access_panel.dmi'
	icon_state = "card_reader"

/obj/structure/machinery/door_control/card/attack_hand(mob/living/user)
	add_fingerprint(user)
	to_chat(user, SPAN_NOTICE("It's a card reader. Poking it with your finger achieves nothing."))

/obj/structure/machinery/door_control/card/attackby(obj/item/W, mob/user as mob)
	if(!istype(W, /obj/item/card/data/access))
		to_chat(user, SPAN_WARNING("[src] doesn't fit into the slot."))
		return
	var/obj/item/card/data/access/card = W
	if(!card.id_list.Find(id))
		to_chat(user, SPAN_WARNING("You slot [card] into the card reader. Nothing happens."))
		return
	use_button(user)

/obj/structure/machinery/door_control/card/use_button(mob/living/user, force = FALSE)
	if(inoperable())
		to_chat(user, SPAN_WARNING("[src] doesn't seem to be working."))
		return

	use_power(5)
	icon_state = initial(icon_state) + "1"
	add_fingerprint(user)

	switch(normaldoorcontrol)
		if(CONTROL_NORMAL_DOORS)
			handle_door()
		if(CONTROL_POD_DOORS)
			handle_pod()
		if(CONTROL_DROPSHIP)
			handle_dropship(id)

	desiredstate = !desiredstate
	spawn(15)
		icon_state = initial(icon_state) + "0"

/obj/item/card/data/access
	name = "access card"
	desc = "An access card used to interact with card readers."
	icon_state = "centcom_old"
	item_state = "red-id"
	var/list/id_list = list()

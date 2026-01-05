/obj/structure/machinery/fabricator
	name = "weird fabricator"
	desc = "A fabricator that produces REDACTED. It's hooked into a centralized feedstock in the bowels of the ship and can pull a limited -- wait, what? This really shouldn't be here. You should report it to a coder. Oh, fuck. Oh, God, the game sucks! IT SUCKS!"
	icon_state = "autolathe"
	var/base_state = "autolathe"
	density = TRUE
	anchored = TRUE

	var/max_points = 0
	var/current_points = 0
	var/current_tab = null
	var/is_busy = FALSE

	var/list/categories = list()
// 	categories = list("Rifle", "SMG", "Shotgun", "Revolver", "Pistol")
	var/list/recipes = list()
	// "name" = list(obj path, price, amount, category)
	// "Rifle magazine (M41A-MK1)" = list(/obj/item/ammo_magazine/rifle/m41aMK1, 2, 1, "Rifle"),

//^^ rewrite

/obj/structure/machinery/fabricator/attack_hand(mob/user)
	if(..())
		return
	tgui_interact(user)

/obj/structure/machinery/fabricator/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Autolathe", "[name] control panel")
		ui.open()

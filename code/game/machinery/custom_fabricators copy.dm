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

/obj/structure/machinery/fabricator/ui_data(mob/user)
	var/list/data = list()

	data["name"] = name
	data["busy"] = is_busy
	data["points"] = current_points
	data["max_points"] = max_points

	data["categories"] = categories
	data["current_tab"] = current_tab

	var/list/printables = list()

	for(var/recipe_name in recipes)
		var/list/R = recipes[recipe_name]
		if(!islist(R) || length(R) < 4)
			continue

		if(current_tab && R[4] != current_tab)
			continue

		var/cost = R[2]

		printables += list(list(
			"name" = recipe_name,
			"cost" = cost,
			"amount" = R[3],
			"can_make" = (current_points >= cost) && !is_busy
		))

	data["printables"] = printables

	return data

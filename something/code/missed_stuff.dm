/obj/item/ammo_magazine/rifle/m41aMK1/short
	name = "\improper M41A shorted magazine (10x24mm)"
	desc = "A shorted rectangular box magazine for the M41A. Holds 49 caseless 10x24mm rounds."
	max_rounds = 49

/obj/item/ammo_magazine/rifle/m41aMK1/extended
	name = "\improper M41A extended magazine (10x24mm)"
	desc = "A extended rectangular box magazine for the M41A. Holds 49 caseless 10x24mm rounds."
	max_rounds = 159

/obj/item/clothing/head/helmet/marine/leader/extraction
	name = "\improper M11 pattern helmet"

/obj/item/clothing/head/helmet/marine/specialist/extraction
	name = "\improper B12 helmet"
	desc = "Helmet and faceplate component of the B12 armor system. Nanobonded carbonfiber laminated with ultrahigh molecular density polymer, with an integral rebreather and heads up display."
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_VERYHIGHPLUS
	armor_bio = CLOTHING_ARMOR_MEDIUMHIGH
	armor_rad = CLOTHING_ARMOR_MEDIUMHIGH
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH
	unacidable = TRUE
	anti_hug = 2
	force = 20

/obj/item/clothing/head/helmet/marine/CO/extraction
	name = "\improper M4 army helmet"
	desc = "A special M4 army Helmet worn by Commanding Officers of the Army. It reads on the label, 'The difference between an open-casket and closed-casket funeral. Wear on head for best results.'."

/obj/item/clothing/suit/storage/marine/MP/CO/extraction
	name = "\improper B4 army armor"

/obj/effect/spawner/prop_gun/memorial
	prop_gun_type = /obj/item/weapon/gun/rifle/m41aMK1/navy
	custom_gun_name = "\improper GUU-71/A pulse rifle 'Ashes'"
	custom_gun_desc = "This rifle was found shattered among the remains of its last owner, Lieutenant F. Morrow. The internals are destroyed, the frame bent, and the grenade tube collapsed. It will never fire again, a broken monument to its final battle."

/obj/item/prop/magazine/book/synthetic_repair_manual
	name = "Hyperdyne Systems Synthetic Maintenance Handbook"
	icon_state = "book_engineering"
	desc = "An official Hyperdyne Systems field manual covering standard diagnostics, modular replacement, and emergency protocols for company-grade synthetics. Sections include hydraulic repair, memory core stabilization, and behavioral safeguard checks. Stamped with Weyland-Yutani oversight approval."

/obj/item/prop/almayer/lim_foto
	name = "Faded Photo"
	desc = "A faded photograph showing two figures standing somewhere in the jungle. One of them is clearly identified as Lieutenant Fox Morrow. The other remains unnamed, but their face feels strangely familiar."
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "photo_corridor"
	w_class = SIZE_SMALL

// Squad specialization

/obj/item/pamphlet/skill/specialization
	name = "Platoon Specialization Book"
	desc = "A worn training manual detailing platoon roles and HUD protocols. Its pages are mostly blank, suggesting it was never fully issued."
	icon = 'icons/obj/items/books.dmi'
	icon_state = "book_black"
	trait = /datum/character_trait/skills/intel	//Just a placeholder trait to give so it doesn't freak the fuck out
	flavour_text = "You flip through the manual, the paper creaking faintly, but find little of real use inside."

/obj/item/pamphlet/skill/specialization/can_use(mob/living/carbon/human/user)
	if(user.job != JOB_SQUAD_MARINE)
		to_chat(user, SPAN_WARNING("Only squad riflemen can use this."))
		return

	var/obj/item/card/id/ID = user.get_idcard()
	if(!ID) //not wearing an ID
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE
	if(!ID.check_biometrics(user))
		to_chat(user, SPAN_WARNING("You should wear your ID before doing this."))
		return FALSE

	return ..()

/obj/item/pamphlet/skill/specialization/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "Mar"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Rifleman")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Rifleman")

/obj/item/pamphlet/skill/specialization/comtech
	name = "Combat Technician Field Manual"
	desc = "A slim handbook outlining procedures, HUD protocols, and emergency repairs for frontline combat technicians. The cover bears faint engineering highlights."
	icon_state = "book_orange"

/obj/item/pamphlet/skill/specialization/comtech/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "engi"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Combat Technician")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Combat Technician")

/obj/item/pamphlet/skill/specialization/ammo_bearer
	name = "Ammo Bearer Field Manual"
	desc = "A compact handbook covering load distribution, resupply procedures, and battlefield logistics for platoon ammo bearers. The cover shows faint marks of heavy use."
	icon_state = "book_dark"

/obj/item/pamphlet/skill/specialization/ammo_bearer/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "load"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Ammo Bearer")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Ammo Bearer")

/obj/item/pamphlet/skill/specialization/sniper
	name = "Sniper Field Manual"
	desc = "A concise handbook detailing marksmanship techniques, spotting protocols, and long-range engagement doctrine for designated marksmen. Its cover is lined with precise sighting diagrams."
	icon_state = "book_tan"

/obj/item/pamphlet/skill/specialization/sniper/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "ass"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Sniper")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Sniper")

/obj/item/pamphlet/skill/specialization/machinegunner
	name = "Machine Gunner Field Manual"
	desc = "A rugged handbook outlining suppression tactics, firing lane control, and sustained fire procedures for platoon machine gunners. The cover is worn from repeated handling."
	icon_state = "book_dark"

/obj/item/pamphlet/skill/specialization/machinegunner/on_use(mob/living/carbon/human/user)
	. = ..()
	user.rank_fallback = "gun"
	user.hud_set_squad()

	var/obj/item/card/id/ID = user.get_idcard()
	ID.set_assignment((user.assigned_squad ? (user.assigned_squad.name + " ") : "") + "Machinegunner")
	GLOB.data_core.manifest_modify(user.real_name, WEAKREF(user), "Machinegunner")

/obj/structure/machinery/cm_vending/sorted/coins
	name = "\improper Token Register"
	desc = "A Seegson brand point of sales system that accepts credit chits... and cash assuming it is operated. Rumor has it these use the same logic board as Seegson Working Joes. You are becoming financially unstable."
	icon = 'something/icons/cash_register.dmi'
	icon_state = "cash"

	listed_products = list(
		list("Money", -1, null, null),
		list("One-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/one, VENDOR_ITEM_REGULAR),
		list("Five-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/five, VENDOR_ITEM_REGULAR),
		list("Ten-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/ten, VENDOR_ITEM_REGULAR),
		list("Twenty-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/twenty, VENDOR_ITEM_REGULAR),
		list("Fifty-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/fifty, VENDOR_ITEM_REGULAR),
		list("One-Hundred-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/onehundred, VENDOR_ITEM_REGULAR),
		list("Two-Hundred-Credit Requisition Token", 50, /obj/item/coin/requisitionpoint/twohundred, VENDOR_ITEM_REGULAR)
	)

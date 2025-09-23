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

// noise tv redone //

/obj/structure/machinery/prop/almayer/computer/noisetv
	name = "transmission center"
	desc = "A device assembled from a variety parts, waiting to receive a transmission."
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "tvnoise"
	anchored = TRUE
	density = TRUE
	var/on = FALSE

/obj/structure/machinery/prop/almayer/computer/noisetv/ex_act(severity)
	switch(severity)
		if(EXPLOSION_THRESHOLD_LOW to INFINITY)
			if(prob(50))
				audible_message(SPAN_WARNING("The [src] is damaged by the explosion!"))
				on = FALSE
				update_icon()
				set_light(0)
				playsound(src, null, 0)
				addtimer(CALLBACK(src, .proc/endnoise), 1 SECONDS)
				qdel(src)
	return

/obj/structure/machinery/prop/almayer/computer/noisetv/Initialize(mapload, ...)
	. = ..()
	on = TRUE
	addtimer(CALLBACK(src, .proc/playnoise), 1)

/obj/structure/machinery/prop/almayer/computer/noisetv/power_change()
	..()
	if(stat & NOPOWER)
		if(on)
			on = FALSE
			endnoise()
	else
		if(!on)
			on = TRUE
			addtimer(CALLBACK(src, .proc/playnoise), 1)
	update_icon()

/obj/structure/machinery/prop/almayer/computer/noisetv/proc/playnoise()
	if(!on)
		return
	if(QDELETED(src) || !on)
		return

	playsound(src, pick('something/sounds/noise.ogg', 'something/sounds/noise2.ogg','something/sounds/noise3.ogg'), 25)
	if(prob(10))
		var/phrase_1 = pick("Silent clearance", "Lost connection", "Incident report", "The-e-e-e-e", "A new decision has been made", "A measure of necessity")
		var/phrase_2 = pick("Weyland-Yutani Directorate", "UPP field command", "Lord-Renegade", "Sector smugglers ring", "Hub Council", "Syndicate Dirrectors", "Colonial Administration office", "Unknown relay node")
		var/phrase_3 = pick("Lost colony on LV-426", "Unmarked freighter drifting in orbit", "Experimental bio-weapon shipment", "Unstable reactor in Borealis sector", "Resurgence of insurgent cells", "Unexplained disappearances in colony", "Derelict vessel with distress beacon", "Strange signals from deep space")
		visible_message(SPAN_LARGE("Noise-covered voices come from the [src]: '[phrase_1]... [phrase_2]... [phrase_3]'"), null, 3, CHAT_TYPE_OTHER)
	if(on)
		addtimer(CALLBACK(src, .proc/playnoise), 7 SECONDS)

/obj/structure/machinery/prop/almayer/computer/noisetv/proc/endnoise()
	playsound(src, null, 0)
	set_light(0)
	update_icon()
	audible_message(SPAN_WARNING("Everything went quiet."))

/obj/structure/machinery/prop/almayer/computer/noisetv/bigger
	icon_state = "tvnoisebigger"

/obj/structure/machinery/prop/almayer/computer/noisetv/old
	name = "old TV"
	desc = "An old TV. You doubt that it still works."
	icon_state = "tvnoiseold"

// noise tv redone over //

// organ harvester & case //

/obj/item/device/orgna_harvester
	name = "organ harvester"
	desc = "A crude surgical tool for ripping out organs. It is designed for rapid organ extraction, but unfortunately, due to its compact size and technology, it can only be used a very limited number of times."
	icon_state = "mendoza_scanner"
	w_class = SIZE_SMALL
	in_use = FALSE

	var/uses_left = 3
	var/list/organs_possible = list(
		/obj/item/organ/heart,
		/obj/item/organ/heart/prosthetic,
		/obj/item/organ/liver,
		/obj/item/organ/liver/prosthetic,
		/obj/item/organ/brain,
		/obj/item/organ/lungs,
		/obj/item/organ/lungs/prosthetic,
		/obj/item/organ/kidneys,
		/obj/item/organ/kidneys/prosthetic,
		/obj/item/organ/eyes,
		/obj/item/organ/eyes/prosthetic
	)

	var/broken = FALSE

/obj/item/device/orgna_harvester/Initialize()
	. = ..()
	update_icon()

/obj/item/device/orgna_harvester/get_examine_text(mob/user)
	. = ..()
	. += "It has [uses_left] charge remaining."

/obj/item/device/orgna_harvester/update_icon()
	. = ..()
	overlays.Cut()
	overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_value_flash")
	if(broken)
		overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_flash")
	if(in_use)
		overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_clamp_on")
		overlays += image('icons/obj/items/devices.dmi', pick("+mendoza_scanner_value_red", "+mendoza_scanner_value_yellow", "+mendoza_scanner_value_orange", "+mendoza_scanner_value_green", "+mendoza_scanner_value_cyan", "+mendoza_scanner_value_white"))
	else
		overlays += image('icons/obj/items/devices.dmi', "+mendoza_scanner_clamp_off")

/obj/item/device/orgna_harvester/attack(mob/living/carbon/human/target, mob/user)
	if(!skillcheck(user, SKILL_SURGERY, SKILL_SURGERY_NOVICE))
		to_chat(user, SPAN_WARNING("You do not know how to use the [name]."))
		return

	if(broken)
		to_chat(user, SPAN_WARNING("The extractor is broken and useless."))
		return

	if(!uses_left)
		to_chat(user, SPAN_WARNING("The extractor is broken and useless."))
		return

	if(!(target.stat == DEAD))
		to_chat(user, "<span class='warning'>The target must be dead first!</span>")
		return

	if(issynth(target))
		to_chat(user, SPAN_WARNING("You cannot extract organs from synthetics."))
		return

	if(in_use)
		return

	in_use = TRUE
	update_icon()
	playsound(user.loc, 'sound/surgery/saw.ogg', 25)
	to_chat(user, SPAN_NOTICE("You begin extracting an organ..."))

	if(!do_after(user, 15 SECONDS, INTERRUPT_NO_NEEDHAND, BUSY_ICON_HOSTILE))
		to_chat(user, SPAN_NOTICE("You stop extracting."))
		in_use = FALSE
		update_icon()
		return

	var/organ_type = pick(organs_possible)
	var/obj/item/organ/O = new organ_type(target.loc)
	O.name = "[target.real_name]'s [O.name]"

	visible_message(
		SPAN_DANGER("[user] violently extracts an organ from [target]!"),
		SPAN_NOTICE("You tear out [O.name] from [target].")
	)
	playsound(user.loc, pick('sound/surgery/organ1.ogg', 'sound/surgery/organ2.ogg'), 25)

	uses_left--
	if(uses_left <= 0)
		broken = TRUE
		playsound(user.loc, 'sound/effects/metal_shatter.ogg', 25)
		to_chat(user, SPAN_WARNING("The organ extractor snaps apart after its final use!"))
	in_use = FALSE
	update_icon()

// case //

/obj/item/storage/firstaid/organ
	name = "organ case"
	desc = "It's a medical case for storing organs."
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "organ_case"
	open_state = "organ_case_open"
	storage_slots = 3
	w_class = SIZE_SMALL
	can_hold = list(
		/obj/item/organ,
	)

// organ harvester & case over //

#define JOB_UPP_SYNTH_ASCLEPIUS "Replicant"

/obj/item/device/radio/headset/almayer/marine/solardevils/mari
	name = "\improper Soyuz headset"
	desc = "A special headset used by Mari."
	icon_state = "eng_headset"
	item_state = "eng_headset"

/obj/item/clothing/under/marine/veteran/owlf/mari
	name = "\improper Soyuz Biological Uniform"
	desc = "placeholder"

/obj/item/clothing/mask/owlf_mask/mari
	name = "\improper Soyuz bio mask"
	desc = "placeholder"

/obj/item/clothing/mask/gas/kutjevo/mari
	name = "\improper Soyuz gas mask"
	desc = "placeholder"

/obj/item/clothing/under/rank/synthetic/joe/engi/overalls/mari
	name = "\improper Soyuz Hazardous Uniform"
	desc = "placeholder"

/obj/item/clothing/gloves/marine/joe/mari
	name = "\improper Soyuz hazardous gloves"
	desc = "placeholder"

/datum/equipment_preset/upp/synth/mari
	name = "\improper Soyuz Replicant"
	flags = EQUIPMENT_PRESET_EXTRA
	languages = ALL_SYNTH_LANGUAGES_UPP
	skills = /datum/skills/synthetic
	assignment = "Replicant"
	rank = JOB_UPP_COMBAT_SYNTH
	paygrades = list(PAY_SHORT_SYN = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_UPP_GENERAL, ACCESS_UPP_SECURITY, ACCESS_UPP_ARMORY, ACCESS_UPP_FLIGHT, ACCESS_UPP_SQUAD_ONE, ACCESS_UPP_SQUAD_TWO, ACCESS_UPP_LEADERSHIP, ACCESS_UPP_SENIOR_LEAD, ACCESS_UPP_MEDPREP, ACCESS_UPP_TLPREP, ACCESS_MARINE_AI, ACCESS_ARES_DEBUG)
	idtype = /obj/item/card/id
/*
/datum/equipment_preset/upp/synth/mari/load_gear(mob/living/carbon/human/new_human)
	//back
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/mari, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/surgical, WEAR_FACE)
	//head
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/owlf, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/owlf_vest, WEAR_ACCESSORY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/officer, WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/full, WEAR_WAIST)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex, WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/owlf_mask, WEAR_R_STORE)
*/
/datum/equipment_preset/upp/synth/mari/load_gear(mob/living/carbon/human/new_human)
	var/dressvariety = rand(1,3)
	switch(dressvariety)
		if(1)
			//back
			//face
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/mari, WEAR_L_EAR)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/surgical, WEAR_FACE)
			//head
			//uniform
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/owlf/mari, WEAR_BODY)
			//jacket
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/labcoat/officer, WEAR_JACKET)
			//waist
			//limbs
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp, WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex, WEAR_HANDS)
			//pockets
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/owlf_mask/mari, WEAR_R_STORE)
		if(2)
			//back
			//face
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/mari, WEAR_L_EAR)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/kutjevo/mari, WEAR_FACE)
			//head
			//uniform
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/synthetic/joe/engi/overalls/mari, WEAR_BODY)
			//jacket
			new_human.equip_to_slot_or_del(new /obj/item/maintenance_jack, WEAR_J_STORE)
			//waist
			//limbs
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/joe, WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/joe/mari, WEAR_HANDS)
			//pockets
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling, WEAR_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/device/working_joe_pda, WEAR_IN_R_STORE)
		if(3)
			//back
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/upp, WEAR_BACK)
			//face
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/solardevils/mari, WEAR_L_EAR)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/upp, WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/upp, WEAR_FACE)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles/upp, WEAR_EYES)
			//jacket
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/smartgunner/upp, WEAR_JACKET)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/upp, WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/upp, WEAR_IN_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smartgun/upp, WEAR_IN_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/smartgun_battery/upp, WEAR_IN_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/smartgun_battery/upp, WEAR_IN_J_STORE)
			//uniform
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/UPP, WEAR_BODY)
			//waist
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/type47/revolver, WEAR_WAIST)
			//limbs
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard, WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/brown, WEAR_HANDS)
			//pockets
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/upp, WEAR_L_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/uppsynth, WEAR_R_STORE)

// dlya remonta

/obj/item/prop/almayer/repair
	name = "placeholder"
	desc = "placeholder"
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "box_crate"
	w_class = SIZE_LARGE

/obj/item/prop/almayer/repair/repair_kit
	name = "Universal Repair Kit"
	desc = "A compact toolbox containing basic and advanced tools, along with standard consumables. Suitable for patching walls, fixing floors, and handling general maintenance tasks."
	icon_state = "box_crate"

/obj/item/prop/almayer/repair/rk_structural
	name = "Structural Repair Pack"
	desc = "A package of prefabricated wall panels, floor tiles, paint, and cosmetic trims. Designed for restoring both stability and the original look of rooms."
	icon_state = "box_w"

/obj/item/prop/almayer/repair/rk_electronics
	name = "Electronic Repair Set"
	desc = "A container with circuit boards, wiring spools, stabilizers, and control modules. Used to restore damaged terminals, power lines, and automated systems."
	icon_state = "box_ecrate"

/obj/item/prop/almayer/repair/rk_material
	name = "Construction Materials Pack"
	desc = "A bundle of raw supplies: metal sheets, insulation rolls, adhesives, and sealing compounds. Provides the base resources needed for room restoration."
	icon_state = "box_z"

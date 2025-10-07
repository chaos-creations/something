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

/obj/item/ammo_box/rounds/m16
	name = "\improper rifle ammunition box (5.56x45mm)"
	desc = "A 5.56x45mm ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "5.56x45mm"
	default_ammo = /datum/ammo/bullet/rifle/m16

/obj/item/ammo_box/rounds/mar
	name = "\improper rifle ammunition box (8.8x29mm)"
	desc = "A 8.8x29mm ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "8.8x29mm"
	default_ammo = /datum/ammo/bullet/rifle/mar40

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

/obj/item/prop/almayer/jaguar_book
	name = "Faded Notepad"
	desc = "Some old notebook, it seems there are notes in it..."
	icon = 'icons/obj/items/notepads.dmi'
	icon_state = "notebook_red"
	w_class = SIZE_SMALL
	var/pointer = 0
	var/lore_blurb = 1

/obj/item/prop/almayer/jaguar_book/attack_self(mob/user)
	. = ..()
	pointer++
	playsound(src, "paper_writing", 15, 1)
	switch(lore_blurb)
		if(1)
			switch(pointer)
				if(1)
					to_chat(user, SPAN_NOTICE("Мой отряд мёртв, а я остался один. Улицы завалены телами, пахнет гарью и расплавленным металлом. Это больше не город, а склеп."))
				if(2)
					to_chat(user, SPAN_NOTICE("Бывшие охранники Вейланд-Ютани держат периметр у какой-то лаборатории. Их патрули беспощадны. Дикие рвут всё, что выходит за стены. Я между ними, как крыса."))
				if(3)
					to_chat(user, SPAN_NOTICE("Ночью слышал стрельбу — автоматные очереди и крики. Скорее всего, Дикие налетели на гарнизон ТВЕ. Если ещё кто-то выжил — они держатся из последних сил."))
				if(4)
					to_chat(user, SPAN_NOTICE("Патронов мало. Один выстрел — одно тело. Если промахнусь — завтра меня не станет."))
				if(5)
					to_chat(user, SPAN_NOTICE("Нахожу старые журналы Вейланд-Ютани в подвалах. Все про «перспективные исследования», «долгосрочные активы». Интересно, где эти активы сейчас? На орбите — в виде ржавого металлолома."))
				if(6)
					to_chat(user, SPAN_WARNING("Дикие смеются. Слышно, как они жгут трупы прямо на площади. Иногда они поют. Песни тех, у кого нет ничего, кроме ярости."))
				if(7)
					to_chat(user, SPAN_NOTICE("Склады пусты. Всё, что осталось — ловушки, мины и запах смерти. Корпорация знала, что город обречён. Нам дали приказ держаться, а снабжения не было. Никогда не было."))
				if(8)
					to_chat(user, SPAN_WARNING("Ночью дождь. Смывает кровь, но запах остаётся. Я мечтаю, чтобы он смыл и меня."))
				if(9)
					to_chat(user, SPAN_NOTICE("Если кто-то найдёт этот блокнот: Я был в отряде 'Ночных Сов', мы пришли на помощь гарнизону, но мы так и не дошли до него, теперь этот город наша могила."))
				if(10)
					to_chat(user, SPAN_NOTICE("Больше нету записей..."))
					pointer = 0

// weapon //

/obj/item/weapon/gun/rifle/l42a/sniper
	starting_attachment_types = list(/obj/item/attachable/stock/carbine, /obj/item/attachable/scope/mini)

/obj/item/weapon/gun/pkp/standard
	current_mag = /obj/item/ammo_magazine/pkp/standard_fmj

/obj/item/weapon/gun/rifle/lw317/dmr/standard
	current_mag = /obj/item/ammo_magazine/rifle/lw317

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
	icon = 'something/icons/noise.dmi'
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

/turf/closed/noise
	name = "distant noise"
	desc = "In these days, electrical noise follows people everywhere. Not always intelligible, but always unstoppable. It is like radio interference. It seems to intensify as it approaches the boundary of known space. Sometimes you can make out words in the noise. A strange whisper that makes no sense."
	icon = 'something/icons/noise.dmi'
	icon_state = "noise1"
	var/on = TRUE //virubator 3000

	light_range = 3
	light_power = 0.8
	light_color = "#ffffff"

/turf/closed/noise/Initialize(mapload, ...)
	. = ..()
	icon_state = "noise[rand(1,3)]"
	addtimer(CALLBACK(src, .proc/playnoise), rand(10,20) SECONDS)

/turf/closed/noise/proc/playnoise()
	if(QDELETED(src) || !on)
		return

	playsound(src, pick('something/sounds/noise.ogg', 'something/sounds/noise2.ogg','something/sounds/noise3.ogg'), 25, 0, 4)

	addtimer(CALLBACK(src, .proc/playnoise), rand(10,20) SECONDS)

// noise tv redone over //

// decor //

/obj/structure/bed/chair/wood/divan
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "sofa_l"
	name = "wooden sofa"
	desc = "Old is never too old to not be in fashion."

/obj/structure/bed/chair/wood/divan/r
	icon_state = "sofa_r"

/obj/structure/ladder/hole
	name = "suspicious hole"
	desc = "Definitely a very ordinary hole, it seems even an adult could crawl through it."
	icon = 'icons/effects/new_acid.dmi'
	icon_state = "hole_0"
	climb_sound = 'sound/effects/metal_creaking.ogg'
	climb_time = 40

/obj/structure/ladder/hole/update_icon()
	return

/obj/structure/ladder/scav_raider
	name = "Vehicle Door"
	desc = "Door from scavenger vehicle, it seems you can climb through it."
	layer = 3.76
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "scav_door"
	climb_sound = 'sound/effects/metal_door_open.ogg'
	climb_time = 15

/obj/structure/ladder/scav_raider/update_icon()
	return

/obj/structure/ladder/scav_raider/other
	layer = BELOW_MOB_LAYER
	icon_state = "scav_door_other"

/obj/structure/ladder/scav_raider/other/update_icon()
	return


// organ harvester & case //

/obj/item/device/organ_harvester
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

/obj/item/device/organ_harvester/Initialize()
	. = ..()
	update_icon()

/obj/item/device/organ_harvester/get_examine_text(mob/user)
	. = ..()
	. += "It has [uses_left] charge remaining."

/obj/item/device/organ_harvester/update_icon()
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

/obj/item/device/organ_harvester/attack(mob/living/carbon/human/target, mob/user)
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

// other torkovec //

/obj/structure/prop/invuln/scav_raider
	name = "\improper M577 Obedience"
	desc = "A large, armored behemoth capable of ferrying marines around. \n This one looks a little battered and seems to already belong to someone."
	layer = BELOW_MOB_LAYER
	icon = 'something/icons/scav_vehicle.dmi'
	icon_state = "scav_raider"

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

// pets //

/mob/living/simple_animal/hostile/retaliate/giant_lizard/storm
	name = "Storm"
	desc = "A wolf-sized lizard wearing a collar. He has a very naughty character and loves to constantly litter everywhere, most of his time he just sleeps in a mountain of trash that he himself creates."
	icon_state = "Storm Running"
	icon_living = "Storm Running"
	maxHealth = 700
	health = 700
	faction = "USCM"
	melee_damage_lower = 0
	melee_damage_upper = 0

/mob/living/simple_animal/hostile/retaliate/giant_lizard/storm/update_transform(instant_update = FALSE)
	if(stat == DEAD)
		icon_state = icon_dead
	else if(body_position == LYING_DOWN)
		if(!HAS_TRAIT(src, TRAIT_INCAPACITATED) && !HAS_TRAIT(src, TRAIT_FLOORED))
			icon_state = "Storm Sleeping"
		else
			icon_state = "Giant Lizard Knocked Down"
	else
		icon_state = icon_living
	return ..()

/mob/living/simple_animal/mouse/rat/white/freelancer
	name = "War Boss"
	desc = "A combat mouse who had fought in more than one cheese war on this godforsaken ship. He was captured after being caught red-handed stealing cheese from the freelancers' secret storage behind the washing machine."
	gender = MALE
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "splats"
	holder_type = /obj/item/holder/rat/white/Milky

/obj/item/holder/rat/white/freelancer
	name = "War Boss"
	desc = "A combat mouse who had fought in more than one cheese war on this godforsaken ship. He was captured after being caught red-handed stealing cheese from the freelancers' secret storage behind the washing machine."

// evil stanki //

/obj/structure/ammunition_fabricator
	name = "ammunition fabricator"
	desc = "An old ammunition fabricator that runs on a good word, it seems to have a limited number of charges."
	icon = 'something/icons/missed_stuff.dmi'
	icon_state = "os_autolathe"
	density = TRUE
	anchored = TRUE

	var/max_points = 4
	var/current_points = 4
	var/current_tab = "ammo" // "ammo", "magazines", "shells", "revolver"
	var/fixed_category = null  // stores a category that has already been repaired
	var/is_busy = FALSE

	/// Recipe list: [name] = list(type, price, quantity, category)
	var/list/recipes = list(
		// round box
		"Rifle Ammo box (10x24mm)" = list(/obj/item/ammo_box/rounds, 3, 1, "ammo"),
		"Rifle Ammo box (5.56x45mm)" = list(/obj/item/ammo_box/rounds/m16, 3, 1, "ammo"),
		"Rifle Ammo Box (8.8x29mm)" = list(/obj/item/ammo_box/rounds/mar, 3, 1 , "ammo"),
		"SMG Ammo Box (9mm)" = list(/obj/item/ammo_box/rounds/smg, 3, 1, "ammo"),
		// handgun
		"Pistol magazines (VP70, 9x19mm)" = list(/obj/item/ammo_magazine/pistol/vp70, 1, 3, "magazines"),
		"Pistol magazines, Extended (VP70, 9x19mm)" = list(/obj/item/ammo_magazine/pistol/vp70/extended, 1, 2, "magazines"),
		"Pistol magazines (M4A3, 9x19mm)" = list(/obj/item/ammo_magazine/pistol, 1, 3, "magazines"),
		"Pistol magazines (M1911, .45)" = list(/obj/item/ammo_magazine/pistol/m1911, 1, 3, "magazines"),
		"Pistol magazines (VP78, 9x19mm)" = list(/obj/item/ammo_magazine/pistol/vp78, 1, 2, "magazines"),
		"Pistol magazines, Armor-Piercing (VP70, 9x19mm)" = list(/obj/item/ammo_magazine/pistol/vp70/ap, 2, 2, "magazines"),
		"Pistol magazines, Incendiary (VP70, 9x19mm)" = list(/obj/item/ammo_magazine/pistol/vp70/incendiary, 2, 2, "magazines"),
		"Revolver speed loader (M44, .44)" = list(/obj/item/ammo_magazine/revolver, 1, 3, "revolver"),
		"Revolver speed loader, Heavy (M44, .44)" = list(/obj/item/ammo_magazine/revolver/heavy, 2, 3, "revolver"),
		// main weapon
		"Rifle magazines (AR-10, 9mm)" = list(/obj/item/ammo_magazine/rifle/ar10, 1, 2, "magazines"),
		"Rifle magazines (M16, 5.56x45mm)" = list(/obj/item/ammo_magazine/rifle/m16, 1, 2, "magazines"),
		"Rifle magazines, Extended (M16, 5.56x45mm)" = list(/obj/item/ammo_magazine/rifle/m16/extended, 2, 2, "magazines"),
		"Rifle magazines, (MAR-40, 8.8x29mm)" = list(/obj/item/ammo_magazine/rifle/mar40, 1, 2, "magazines"),
		"Rifle magazines, Extended (MAR-40, 8.8x29mm)" = list(/obj/item/ammo_magazine/rifle/mar40/extended, 2, 2, "magazines"),
		"Rifle magazines, (ABR-40, 10x24mm)" = list(/obj/item/ammo_magazine/rifle/l42a/abr40, 1, 2, "magazines"),
		"SMG magazines (MAC-15, 9mm)" = list(/obj/item/ammo_magazine/smg/mac15, 1, 3, "magazines"),
		"SMG magazines, Extended (MAC-15, 9mm)" = list(/obj/item/ammo_magazine/smg/mac15/extended, 1, 3, "magazines"),
		"SMG magazines (UZI, 9x21mm)" = list(/obj/item/ammo_magazine/smg/uzi, 1, 3, "magazines"),
		"SMG magazines, Extended (UZI, 9x21mm)" = list(/obj/item/ammo_magazine/smg/uzi/extended, 2, 2, "magazines"),
		"SMG magazines (Viper 9, 9mm)" = list(/obj/item/ammo_magazine/smg/m39, 1, 3, "magazines"),
		"SMG magazines, Extended (Viper 9, 9mm)" = list(/obj/item/ammo_magazine/smg/m39/extended, 2, 2, "magazines"),
		"SMG magazines, Armor-Piercing (Viper 9, 9mm)" = list(/obj/item/ammo_magazine/smg/m39/ap, 2, 2, "magazines"),
		// shotgun
		"Ammo Packet, Slugs (12g)" = list(/obj/item/ammo_magazine/shotgun, 1, 2, "shells"),
		"Ammo Packet, Buckshot (12g)" = list(/obj/item/ammo_magazine/shotgun/buckshot, 1, 2, "shells"),
		"Ammo Packet, Flechette (12g)" = list(/obj/item/ammo_magazine/shotgun/flechette, 2, 2, "shells"),
		// corrupted
	)

	var/list/broken_recipes = list()

/obj/structure/ammunition_fabricator/Initialize()
	. = ..()
	update_broken_recipes()

/obj/structure/ammunition_fabricator/proc/glitch_text(text)
	var/glitched = ""
	for(var/i = 1, i <= length(text), i++)
		var/char = copytext(text, i, i+1)
		if(prob(25))
			char = pick("#", "%", "&", "~", "@", "¤", "§", "µ", "ø", "þ", "æ", "÷", "×", "¤", "¿", "¡", "¶", "£", "¢", "¥", "¤", "Φ", "Ξ", "╳", "Δ", "Ω")
		glitched += char
	return glitched

/obj/structure/ammunition_fabricator/proc/update_broken_recipes()
	broken_recipes = list(
		"ammo" = list(),
		"magazines" = list(),
		"shells" = list(),
		"revolver" = list(),
	)

	for(var/category in broken_recipes)
		var/list/available = list()
		for(var/name in recipes)
			var/data = recipes[name]
			if(data[4] == category)
				available += name

		if(!length(available))
			continue

		// base chance of breakage (depending on the number of recipes)
		// the more recipes, the higher the chance, but the maximum is 60%.
		var/prob_broken = 0.15 + (length(available) * 0.02)
		prob_broken = clamp(prob_broken, 0.25, 0.6)

		// calculating the number of broken recipes
		var/num_broken = round(length(available) * prob_broken)

		// at least one recipe must be broken, if there are very few of them
		if(num_broken == 0 && prob(80))
			num_broken = 1

		// sometimes the old mechanism breaks even a little more
		if(prob(15))
			num_broken += 1

		// determine which recipes will be broken
		while(num_broken-- > 0 && length(available) > 0)
			var/pickname = pick(available)
			broken_recipes[category] += pickname
			available -= pickname

/obj/structure/ammunition_fabricator/attack_hand(mob/user)
	if(!Adjacent(user) || usr.stat)
		return
	ui_open(user)

/obj/structure/ammunition_fabricator/proc/ui_open(mob/user)
	if(is_busy)
		user << browse("<html><body><h3 style='text-align:center; color:red;'>Fabricator busy...</h3></body></html>", "window=ammunition_fabricator;size=300x100")
		return

	var/html = "<html><body style='background-color:#1b1b1b; color:#d0d0d0; font-family:Verdana; font-size:13px;'>"
	html += "<h2 style='text-align:center; color:#f0f0f0;'>Ammunition Fabricator</h2>"
	html += "<p style='text-align:center;'>Fabrication points: <b>[current_points]</b> / [max_points]</p>"

	html += "<div style='text-align:center; margin-bottom:8px;'>"
	html += "<a href='?src=\ref[src];tab=ammo' style='color:[current_tab=="ammo"?"#80ff80":"#888"]; text-decoration:none; margin-right:10px;'>Ammo Boxes</a>"
	html += "<a href='?src=\ref[src];tab=magazines' style='color:[current_tab=="magazines"?"#80ff80":"#888"]; text-decoration:none; margin-right:10px;'>Magazines</a>"
	html += "<a href='?src=\ref[src];tab=shells' style='color:[current_tab=="shells"?"#80ff80":"#888"]; text-decoration:none; margin-right:10px;'>Shells</a>"
	html += "<a href='?src=\ref[src];tab=revolver' style='color:[current_tab=="revolver"?"#80ff80":"#888"]; text-decoration:none;'>Speed Loaders</a>"
	html += "</div><hr style='border:1px solid #444;'>"

	html += "<table style='width:100%; border-collapse:collapse;'>"
	html += "<tr style='color:#aaaaaa;'>"
	html += "<th align='left'>Item</th><th align='right'>Cost</th><th align='center'>Quantity</th><th align='center'>Action</th></tr>"

	var/total = 0
	var/broken = 0

	for(var/name in recipes)
		var/data = recipes[name]
		var/category = data[4]
		if(category != current_tab)
			continue
		total++
		if(name in broken_recipes[current_tab])
			broken++

		var/cost = data[2]
		var/is_broken = (name in broken_recipes[current_tab])

		html += "<tr style='border-bottom:1px solid #333;'>"
		if(is_broken)
			var/glitched = glitch_text(name)
			var/glitch_status = glitch_text("(ERROR)")
			html += "<td style='color:#993333;'>[glitched]</td>"
			html += "<td align='right'>???</td>"
			html += "<td align='center'><span style='color:#663333;'>[glitch_status]</span></td>"
			html += "<td align='center'><span style='color:#663333;'>N/A</span></td>"
		else
			html += "<td>[name]</td>"
			html += "<td align='right'>[cost]</td>"
			html += "<td align='center'>[data[3]]</td>"
			if(current_points >= cost)
				html += "<td align='center'><a href='?src=\ref[src];make=[name]' style='color:#80ff80; text-decoration:none;'>Fabricate</a></td>"
			else
				html += "<td align='center'><span style='color:#888;'>Insufficient</span></td>"
		html += "</tr>"

	html += "</table><hr style='border:1px solid #444;'>"

	// calculation of the degree of damage
	var/integrity = round(((total - broken) / max(1, total)) * 100)
	var/status_color = (integrity >= 80 ? "#80ff80" : integrity >= 50 ? "#ffff80" : "#ff6666")
	html += "<p style='text-align:center; color:[status_color]; font-size:14px;'>System Integrity: [integrity]%"
	if(broken)
		html += " | Critical Data Loss Detected"
	html += "</p>"

	if(fixed_category)
		html += "<p style='text-align:center; color:#999;'>Repair system used on: <b>[fixed_category]</b> tab</p>"

	html += "<p style='text-align:center;'><i>There is a note visible on the edge of the machine interface screen that says 'refurbished batch number ###'.</i></p>"
	html += "</body></html>"

	user << browse(html, "window=ammunition_fabricator;size=620x620")


/obj/structure/ammunition_fabricator/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_MULTITOOL) || ispath(W, /obj/item/device/multitool))
		var/category = current_tab

		// prohibit repeated repairs altogether
		if(fixed_category)
			to_chat(user, "<span class='warning'>The repair subsystem has already been activated for the [fixed_category] tab. Further access is locked.</span>")
			return TRUE

		var/list/broken = broken_recipes[category]
		if(!length(broken))
			to_chat(user, "<span class='notice'>Nothing appears corrupted in the [category] tab.</span>")
			return TRUE

		to_chat(user, "<span class='notice'>You start repairing the [category] system...</span>")
		playsound(src, 'sound/machines/scanning.ogg', 30, TRUE)

		if(!do_after(user, rand(3, 6) SECONDS, INTERRUPT_ALL|BEHAVIOR_IMMOBILE, BUSY_ICON_BUILD))
			to_chat(user, "<span class='warning'>You stop repairing the fabricator.</span>")
			return FALSE

		var/n_total = length(broken)
		var/restore_count = max(1, round(n_total * rand(0.25, 0.5))) // restores 25-50% of broken

		for(var/i = 1 to restore_count)
			var/which = pick(broken)
			broken_recipes[category] -= which

		fixed_category = category
		playsound(src, 'sound/machines/switch.ogg', 35, TRUE)
		to_chat(user, "<span class='notice'>Repair complete — restored [restore_count] recipe(s) in [category].</span>")

		ui_open(user)
		return TRUE

	return ..()

/obj/structure/ammunition_fabricator/Topic(href, href_list)
	. = ..()
	if(is_busy)
		to_chat(usr, "<span class='warning'>Fabricator is busy. Please wait...</span>")
		return

	if(href_list["tab"])
		current_tab = href_list["tab"]
		ui_open(usr)
		return

	if(href_list["make"])
		if(is_busy)
			to_chat(usr, "<span class='warning'>Fabricator is busy. Please wait...</span>")
			return

		is_busy = TRUE
		var/choice = href_list["make"]
		var/list/data = recipes[choice]
		if(!data)
			is_busy = FALSE
			return

		var/category = data[4]
		if(choice in broken_recipes[category])
			to_chat(usr, "<span class='warning'>ERROR: Fabrication data corrupted — cannot print [choice].</span>")
			is_busy = FALSE
			return

		var/typepath = data[1]
		var/cost = data[2]
		var/amount = data[3]

		if(current_points < cost)
			to_chat(usr, "<span class='warning'>Not enough fabrication points!</span>")
			is_busy = FALSE
			return

		var/confirm = alert(usr, "Fabricate [choice] for [cost] point(s)?", "Confirm Fabrication", "Yes", "No")
		if(confirm != "Yes")
			is_busy = FALSE
			return

		current_points -= cost
		to_chat(usr, "<span class='notice'>Fabricator is printing [choice]...</span>")
		playsound(src, 'sound/machines/print.ogg', 25, TRUE)

		sleep(rand(30, 60))

		playsound(src, 'sound/machines/print_off.ogg', 25, TRUE)
		for(var/i in 1 to amount)
			var/obj/item/I = new typepath(get_turf(src))
			if(istype(I, /obj/item/ammo_magazine))
				var/obj/item/ammo_magazine/M = I
				M.current_rounds = rand(5, M.max_rounds)
				M.update_icon()
			else if(istype(I, /obj/item/ammo_box/rounds))
				var/obj/item/ammo_box/rounds/B = I
				B.bullet_amount = rand(100, B.max_bullet_amount)
				B.update_icon()

		to_chat(usr, "<span class='notice'>The fabricator produces [amount]x [choice].</span>")
		to_chat(usr, "<span class='notice'>Fabricator points left: [current_points]/[max_points]</span>")

		is_busy = FALSE
		ui_open(usr)

// keys //

/obj/item/storage/box/keys
	name = "key box"
	desc = "A small box for storing keys."
	storage_slots = 3
	w_class = SIZE_SMALL
	can_hold = list(
		/obj/item/puzzle/keycard,
	)

/obj/item/storage/box/keys/freelancer/fill_preset_inventory()
	new /obj/item/puzzle/keycard/freelancer(src)
	new /obj/item/puzzle/keycard/workshop(src)

/obj/item/storage/box/keys/freelancer/less/fill_preset_inventory()
	new /obj/item/puzzle/keycard/workshop(src)

// quest items //

/obj/item/prop/almayer/synth_disk
	name = "Synthetic Repair Data Disk"
	desc = "A data disk containing repair protocols for synthetic units. It appears to be encrypted with proprietary Weyland-Yutani software."
	icon = 'icons/obj/items/disk.dmi'
	icon_state = "disk_2"

// army scav //

/datum/equipment_preset/usa/sapper/scav
	name = "Army Scav"
	assignment = JOB_ARMY_ENGI
	rank = JOB_ARMY_ENGI
	paygrades = list(PAY_SHORT_SCAV = JOB_PLAYTIME_TIER_0)
	role_comm_title = "Scav"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/sapper
	origin_override = ORIGIN_USCM

/datum/equipment_preset/usa/sapper/scav/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = FEMALE
	var/datum/preferences/A = new
	A.randomize_appearance(new_human)
	new_human.r_hair = 48
	new_human.g_hair = 38
	new_human.b_hair = 18
	new_human.r_eyes = 40
	new_human.g_eyes = 61
	new_human.b_eyes = 39
	new_human.h_style = "Ponytail 4"
	new_human.skin_color = "cmp1"
	new_human.change_real_name(new_human, "Ines Bormann")
	new_human.age = rand(20,35)

/datum/equipment_preset/usa/sapper/scav/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new headset_type(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/rto/army(new_human), WEAR_HEAD)
	add_army_helmet_accessory(new_human)
	add_army_helmet_eyewear(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/army(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big/orange(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/army/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/army/infantry(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/armband/engine(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/tool_webbing/equipped(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/medium/rto/army/medium(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/small/army/alt(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/stock(new_human), WEAR_J_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/full/random(new_human), WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full_barbed_wire(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/welder_chestrig(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/flare(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/toolkit/full(new_human), WEAR_IN_BACK)
	spawn_army_mask_items(new_human)

// unused stuff //

/*

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

*/

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

/obj/item/ammo_box/rounds/sg
	name = "\improper smartgunner ammunition box (10x28mm)"
	desc = "A 10x28mm ammunition box. It comes with a leather strap allowing to wear it on the back."
	caliber = "10x28mm"
	default_ammo = /datum/ammo/bullet/rifle/heavy/tracer

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

/obj/structure/sign/banners/freelancer
	name = "\improper Freelance Cell Flag"
	desc = "An old flag with a white skull on a blue and black background. The old logo of a well-known freelancers mercenaries cell in the Neroid sector. There is an inscription at the back of the skull: \"There is nothing more to me than myself.\""
	icon = 'something/icons/banners.dmi'
	icon_state = "freelanceflag"

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

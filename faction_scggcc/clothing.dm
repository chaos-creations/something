/obj/item/clothing/suit/armor/storage/faction_scg/armored_plate
	name = "Armored plate"
	desc = "Kinda heavy and not that agile as other variants. Still, it's more than enough to protect you. There is SCG patch on the side."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "scg"
	item_state = "scg"
	item_icons = list(
		WEAR_JACKET = 'faction_scggcc/icons/armor_onmob.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM

	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE

	armor_internaldamage = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/suit/armor/storage/faction_gcc/armored_plate
	name = "Armored plate"
	desc = "Kinda heavy and not that agile as other variants. Still, it's more than enough to protect you. There is ICCGN patch on the side."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "gcc"
	item_state = "gcc"
	item_icons = list(
		WEAR_JACKET = 'faction_scggcc/icons/armor_onmob.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM

	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE

	armor_internaldamage = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/head/helmet/faction_scggcc/leader
	name = "Armored beret"
	desc = "An armored mask and hat, used by human squad leaders."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "leader_beret"
	item_state = "leader_beret"
	item_icons = list(
		WEAR_HEAD = 'faction_scggcc/icons/armor_onmob.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_GIGAHIGH
	armor_laser = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_ULTRAHIGH
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH

	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGH

/obj/item/clothing/head/helmet/faction_scg/tacticool
	name = "Armored helmet"
	desc = "An armored helmet. Looks pretty tacticool."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "scg_helmet"
	item_state = "scg_helmet"
	item_icons = list(
		WEAR_HEAD = 'faction_scggcc/icons/armor_onmob.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM

	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE

	armor_internaldamage = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/head/helmet/faction_scg/tacticool/alt
	icon_state = "scg_helmet_alt"
	item_state = "scg_helmet_alt"

/obj/item/clothing/head/helmet/faction_gcc/tacticool
	name = "Armored helmet"
	desc = "An armored helmet. Looks pretty tacticool."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "gcc_helmet"
	item_state = "gcc_helmet"
	item_icons = list(
		WEAR_HEAD = 'faction_scggcc/icons/armor_onmob.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD
	armor_melee = CLOTHING_ARMOR_VERYHIGH
	armor_bullet = CLOTHING_ARMOR_VERYHIGH
	armor_laser = CLOTHING_ARMOR_LOW
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM

	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE

	armor_internaldamage = CLOTHING_ARMOR_VERYHIGH

/obj/item/clothing/head/helmet/faction_gcc/tacticool/alt
	icon_state = "gcc_helmet_alt"
	item_state = "gcc_helmet_alt"

/obj/item/clothing/under/marine/standard/faction_scg
	name = "combat suit"
	desc = "Slightly armored undersuit."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "scg_jumpsuit"
	item_state = "scg_jumpsuit"
	worn_state = "scg_jumpsuit"
	item_icons = list(
		WEAR_BODY = 'faction_scggcc/icons/armor_onmob.dmi'
	)

/obj/item/clothing/under/marine/standard/faction_gcc
	name = "combat suit"
	desc = "Slightly armored undersuit."
	icon = 'faction_scggcc/icons/armor_inv.dmi'
	icon_state = "gcc_jumpsuit"
	item_state = "gcc_jumpsuit"
	worn_state = "gcc_jumpsuit"
	item_icons = list(
		WEAR_BODY = 'faction_scggcc/icons/armor_onmob.dmi'
	)

// OUTFITS

/datum/equipment_preset/faction_scggcc/soldier_scg
	name = "Bay12 | Human | SCG Soldier"
	idtype = null
	languages = list(LANGUAGE_ENGLISH) //Let's keep it simple for now
	faction = FACTION_UNITED_HUMANITY
	faction_group = (FACTION_UNITED_HUMANITY)
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_scggcc/soldier_scg/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_scggcc/soldier_scg/load_gear(mob/living/carbon/human/new_human)

	var/pick_helmet = pick(1,2)
	switch(pick_helmet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_scg/tacticool, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_scg/tacticool/alt, WEAR_HEAD)

	if(prob(30))
		var/obj/item/clothing/suit/armor/storage/faction_scg/armored_plate/M = new()
		var/obj/item/clothing/accessory/poncho/black/W = new()
		M.attach_accessory(new_human, W)
		new_human.equip_to_slot_or_del(M, WEAR_JACKET)

		new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_scg(new_human), WEAR_BODY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_scg(new_human), WEAR_BODY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/faction_scg/armored_plate, WEAR_JACKET)

/datum/equipment_preset/faction_scggcc/soldier_gcc
	name = "Bay12 | Human | ICCGN Soldier"
	idtype = null
	languages = list(LANGUAGE_ENGLISH) //Let's keep it simple for now
	faction = FACTION_UNITED_HUMANITY
	faction_group = (FACTION_UNITED_HUMANITY)
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_scggcc/soldier_gcc/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_scggcc/soldier_gcc/load_gear(mob/living/carbon/human/new_human)

	var/pick_helmet = pick(1,2)
	switch(pick_helmet)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_gcc/tacticool, WEAR_HEAD)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_gcc/tacticool/alt, WEAR_HEAD)

	if(prob(30))
		var/obj/item/clothing/suit/armor/storage/faction_gcc/armored_plate/M = new()
		var/obj/item/clothing/accessory/poncho/black/W = new()
		M.attach_accessory(new_human, W)
		new_human.equip_to_slot_or_del(M, WEAR_JACKET)

		new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_gcc(new_human), WEAR_BODY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_gcc(new_human), WEAR_BODY)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/faction_gcc/armored_plate, WEAR_JACKET)

/datum/equipment_preset/faction_scggcc/leader
	name = "Bay12 | Human | Squad Leader"
	idtype = null
	languages = list(LANGUAGE_ENGLISH) //Let's keep it simple for now
	faction = FACTION_UNITED_HUMANITY
	faction_group = (FACTION_UNITED_HUMANITY)
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_scggcc/leader/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_scggcc/leader/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_scggcc/leader, WEAR_HEAD)

	var/pick_faction = pick(1,2)
	switch(pick_faction)
		if(1)
			var/obj/item/clothing/suit/armor/storage/faction_scg/armored_plate/M = new()
			var/obj/item/clothing/accessory/poncho/black/W = new()
			M.attach_accessory(new_human, W)
			new_human.equip_to_slot_or_del(M, WEAR_JACKET)

			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_scg(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)
		if(2)
			var/obj/item/clothing/suit/armor/storage/faction_gcc/armored_plate/M = new()
			var/obj/item/clothing/accessory/poncho/black/W = new()
			M.attach_accessory(new_human, W)
			new_human.equip_to_slot_or_del(M, WEAR_JACKET)

			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/standard/faction_gcc(new_human), WEAR_BODY)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/fingerless, WEAR_HANDS)

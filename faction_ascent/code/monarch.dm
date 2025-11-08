//SPECIES CODE
#define SPECIES_MONARCH "Monarch"

/obj/effect/temp_visual/dir_setting/bloodsplatter/monarch
	splatter_type = "csplatter"
	color = LIGHT_COLOR_PURPLE

/mob/living/carbon/human/ascent_monarch/Initialize(mapload, new_species = SPECIES_MONARCH)
	. = ..(mapload, new_species)

/datum/species/ascent_monarch
	group = SPECIES_MONARCH
	name = SPECIES_MONARCH
	icobase = 'faction_ascent/icons/gas/body_msw.dmi'
	deform = 'faction_ascent/icons/gas/body_msw.dmi'
	eyes = "blank_s"
	blood_mask = 'faction_ascent/icons/gyne/blood_mask.dmi'
	mob_flags = KNOWS_TECHNOLOGY
	pain_type = /datum/pain/xeno
	unarmed_type = /datum/unarmed_attack/claws/strong
	secondary_unarmed_type = /datum/unarmed_attack/bite/strong
	death_message = "lets out a faint screach as it collapses and stops moving..."
	knock_down_reduction = 0.5
	stun_reduction = 0.5
	gibbed_anim = "gibbed-m"
	dusted_anim = "dust-m"
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_YAUTJA_TECH,
		TRAIT_FOREIGN_BIO,
	)
	blood_color = LIGHT_COLOR_PURPLE
	uses_skin_color = FALSE
	speech_sounds = list('faction_ascent/sounds/ascent1.ogg','faction_ascent/sounds/ascent2.ogg','faction_ascent/sounds/ascent3.ogg',
						'faction_ascent/sounds/ascent4.ogg','faction_ascent/sounds/ascent5.ogg', 'faction_ascent/sounds/ascent6.ogg')
	speech_chance = 100

	slowdown = -1.5 //ебанутый хищник убивца, быстрее чем алат
	total_health = 200 //крепок как гиина

	brute_mod = 0.2 // хитин крепкий, но всё ещё простреливаемый
	burn_mod = 1.5 // ЖГИ ЕГО!!! ЖГИ!!!

	bloodsplatter_type = /obj/effect/temp_visual/dir_setting/bloodsplatter/monarch

/datum/species/ascent_monarch/handle_post_spawn(mob/living/carbon/human/H)
	H.universal_speak = TRUE
	H.universal_understand = TRUE
	H.gender = PLURAL

	return ..()

/datum/species/ascent_monarch/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), pick("pain", "scream"))

//SPECIES EQUIPMENT

// Combat Exosuit
/obj/item/clothing/under/rank/faction_ascent/monarch
	name = "Strange-shaped undersuit"
	desc = "It almost doesn't cover anything."
	icon = 'faction_ascent/icons/gas/onmob/onmob_under_gas.dmi'
	icon_state = "gear_harness_s"
	item_state = "gear_harness_s"
	worn_state = "gear_harness_s"
	item_icons = list(
		WEAR_BODY = 'faction_ascent/icons/gas/onmob/onmob_under_gas.dmi'
	)

/obj/item/clothing/suit/storage/marine/faction_ascent/monarch/exosuit
	name = "Ascent elite combat armor"
	desc = "An heavy armored battle suit, used by Monarch's elite soldiers."
	icon = 'faction_ascent/icons/clothing/obj_suit.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_JACKET = 'faction_ascent/icons/gas/onmob/onmob_back_gas.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_laser = CLOTHING_ARMOR_ULTRAHIGH
	armor_energy = CLOTHING_ARMOR_ULTRAHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGH

	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE

/obj/item/clothing/head/helmet/faction_ascent/monarch/exosuit
	name = "Ascent elite exosuit helmet"
	desc = "An armored head with large antenna's."
	icon = 'faction_ascent/icons/clothing/obj_head.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HEAD = 'faction_ascent/icons/gas/onmob/onmob_head_gas.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_HIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUM
	armor_laser = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_HIGH
	armor_bomb = CLOTHING_ARMOR_LOW

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/shoes/jackboots/faction_ascent/monarch/exosuit
	name = "exosuit appendages"
	desc = "Combat boots, used by Monarch's elite soldiers."
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	icon = 'faction_ascent/icons/clothing/obj_feet.dmi'
	item_icons = list(
		WEAR_FEET = 'faction_ascent/icons/gas/onmob/onmob_suit_gas.dmi'
	)

	flags_armor_protection = BODY_FLAG_FEET|BODY_FLAG_LEGS
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGH

/obj/item/clothing/gloves/combat/faction_ascent/monarch/exosuit
	name = "exosuit appendages"
	desc = "Combat arms, used by Monarch's elite soldiers."
	icon = 'faction_ascent/icons/gas/onmob/onmob_hands_gas.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HANDS = 'faction_ascent/icons/gas/onmob/onmob_hands_gas.dmi'
	)

	flags_armor_protection = BODY_FLAG_HANDS|BODY_FLAG_ARMS
	armor_melee = CLOTHING_ARMOR_ULTRAHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_MEDIUMHIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGH

//OUTFIT PRESETS

/datum/equipment_preset/faction_ascent/monarch/melee
	name = "Bay12 | Monarch | Honor Guard"
	idtype = null
	languages = list(LANGUAGE_YAUTJA) //Let's keep it simple for now
	faction = FACTION_ASCENT
	faction_group = (FACTION_ASCENT)
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_ascent/monarch/melee/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_ascent/monarch/melee/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	var/new_name = "Ascent Honor Guard ([rand(1, 9)][rand(1, 9)][rand(1, 9)])"
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/faction_ascent/monarch/melee/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_MONARCH)
	new_human.body_type = "monarch"

/datum/equipment_preset/faction_ascent/monarch/melee/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/sword/machete/ascent/energy_axe, WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/faction_ascent/monarch(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_ascent/monarch/exosuit, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/faction_ascent/monarch/exosuit, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/faction_ascent/monarch/exosuit, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction_ascent/monarch/exosuit, WEAR_JACKET)


/datum/equipment_preset/faction_ascent/monarch/gunner
	name = "Bay12 | Monarch | Gunner"
	idtype = null
	languages = list(LANGUAGE_YAUTJA) //Let's keep it simple for now
	faction = FACTION_ASCENT
	faction_group = (FACTION_ASCENT)
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_ascent/monarch/gunner/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_ascent/monarch/gunner/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	var/new_name = "Ascent Gunner ([rand(1, 9)][rand(1, 9)][rand(1, 9)])"
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/faction_ascent/monarch/gunner/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_MONARCH)
	new_human.body_type = "monarch"

/datum/equipment_preset/faction_ascent/monarch/gunner/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/machinegun, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/pistol, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/faction_ascent/monarch(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_ascent/monarch/exosuit, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/faction_ascent/monarch/exosuit, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/faction_ascent/monarch/exosuit, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction_ascent/monarch/exosuit, WEAR_JACKET)

/datum/equipment_preset/faction_ascent/monarch/specialist
	name = "Bay12 | Monarch | Specialist"
	idtype = null
	languages = list(LANGUAGE_YAUTJA) //Let's keep it simple for now
	faction = FACTION_ASCENT
	faction_group = (FACTION_ASCENT)
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_ascent/monarch/specialist/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_ascent/monarch/specialist/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	var/new_name = "Ascent Specialist ([rand(1, 9)][rand(1, 9)][rand(1, 9)])"
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/faction_ascent/monarch/specialist/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_MONARCH)
	new_human.body_type = "monarch"

/datum/equipment_preset/faction_ascent/monarch/specialist/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/launcher, WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/pistol, WEAR_WAIST)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/faction_ascent/monarch(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_ascent/monarch/exosuit, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/faction_ascent/monarch/exosuit, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/faction_ascent/monarch/exosuit, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/faction_ascent/monarch/exosuit, WEAR_JACKET)

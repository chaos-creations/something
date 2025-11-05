//SPECIES CODE
#define SPECIES_ALATE "Alate"

/obj/effect/temp_visual/dir_setting/bloodsplatter/kharmaani
	splatter_type = "csplatter"
	color = LIGHT_COLOR_CYAN

/mob/living/carbon/human/ascent_alate/Initialize(mapload, new_species = SPECIES_ALATE)
	. = ..(mapload, new_species)

/datum/species/ascent_alate
	group = SPECIES_ALATE
	name = SPECIES_ALATE
	icobase = 'faction_ascent/icons/alate/body.dmi'
	deform = 'faction_ascent/icons/alate/body.dmi'
	eyes = "blank_s"
	blood_mask = 'faction_ascent/icons/alate/blood_mask.dmi'
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
	blood_color = LIGHT_COLOR_CYAN
	uses_skin_color = FALSE
	speech_sounds = list('faction_ascent/sounds/ascent1.ogg','faction_ascent/sounds/ascent2.ogg','faction_ascent/sounds/ascent3.ogg',
						'faction_ascent/sounds/ascent4.ogg','faction_ascent/sounds/ascent5.ogg', 'faction_ascent/sounds/ascent6.ogg')
	speech_chance = 100

	slowdown = -0.5 //зато очень быстрое
	total_health = 60 //это буквально ходячее стекло - что вы хотите от него?

	brute_mod = 1.2 // нам очень больно от кинетики
	burn_mod = 0.02 // но в целом чхать мы хотели на лазеры и огонь - кремниевые не горят

	bloodsplatter_type = /obj/effect/temp_visual/dir_setting/bloodsplatter/kharmaani

/datum/species/ascent_alate/handle_post_spawn(mob/living/carbon/human/H)
	H.universal_speak = TRUE
	H.universal_understand = TRUE
	H.gender = PLURAL

	return ..()

/datum/species/ascent_alate/handle_death(mob/living/carbon/human/H, gibbed)
	. = ..()
	playsound(H, 'sound/voice/alien_death2.ogg', 75, TRUE)
	if(!gibbed && prob(30))
		var/obj/limb/head = H.get_limb("head")
		head.droplimb(FALSE, TRUE)
		QDEL_NULL(head)

/datum/species/ascent_alate/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), pick("pain", "scream"))

//SPECIES EQUIPMENT

// Utility Suit
/obj/item/clothing/under/rank/faction_ascent/alate/utility
	name = "Strange-shaped undersuit"
	desc = "It almost doesn't cover anything."
	icon = 'faction_ascent/icons/alate/onmob/onmob_under_alate.dmi'
	icon_state = "alate_form"
	item_state = "alate_form"
	worn_state = "alate_form"
	item_icons = list(
		WEAR_BODY = 'faction_ascent/icons/alate/onmob/onmob_under_alate.dmi'
	)

	color = COLOR_GRAY
	flags_jumpsuit = null

/obj/item/clothing/suit/armor/storage/faction_ascent/alate/utility
	name = "Ascent utility suit"
	desc = "An light-armored combat suit, used by Alate workers."
	icon = 'faction_ascent/icons/clothing/obj_suit.dmi'
	icon_state = "utilitysuit"
	item_state = "utilitysuit"
	item_icons = list(
		WEAR_JACKET = 'faction_ascent/icons/alate/onmob/onmob_suit_alate.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	armor_melee = CLOTHING_ARMOR_MEDIUM
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_LOW

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW

/obj/item/clothing/head/helmet/faction_ascent/alate/utility
	name = "Ascent armored helmet"
	desc = "An combat-oriented light purple helmet."
	icon = 'faction_ascent/icons/clothing/obj_head.dmi'
	icon_state = "ascent_general"
	item_state = "ascent_general"
	item_icons = list(
		WEAR_HEAD = 'faction_ascent/icons/alate/onmob/onmob_head_alate.dmi'
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

/obj/item/clothing/shoes/jackboots/faction_ascent/alate/utility
	name = "Light-armored appendages"
	desc = "Simple utility boots, used by Alate workers."
	icon_state = "ascent_boots1"
	item_state = "ascent_boots1"
	icon = 'faction_ascent/icons/alate/onmob/onmob_shoes_alate.dmi'
	item_icons = list(
		WEAR_FEET = 'faction_ascent/icons/alate/onmob/onmob_shoes_alate.dmi'
	)

	flags_armor_protection = BODY_FLAG_FEET
	armor_melee = CLOTHING_ARMOR_MEDIUMLOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bomb = CLOTHING_ARMOR_LOW

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

//  Combat Exosuit
/obj/item/clothing/suit/armor/storage/faction_ascent/alate/exosuit
	name = "Ascent combat armor"
	desc = "An heavy armored battle suit, used by alate soldiers."
	icon = 'faction_ascent/icons/clothing/obj_suit.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_JACKET = 'faction_ascent/icons/alate/onmob/onmob_suit_alate.dmi'
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

/obj/item/clothing/head/helmet/faction_ascent/alate/exosuit
	name = "Ascent exosuit helmet"
	desc = "An armored head with large antenna's."
	icon = 'faction_ascent/icons/clothing/obj_head.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HEAD = 'faction_ascent/icons/alate/onmob/onmob_head_alate.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_GIGAHIGH
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGH
	armor_energy = CLOTHING_ARMOR_GIGAHIGH
	armor_bomb = CLOTHING_ARMOR_HIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_HIGH

/obj/item/clothing/shoes/jackboots/faction_ascent/alate/exosuit
	name = "exosuit appendages"
	desc = "Combat boots, used by Alate soldiers."
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	icon = 'faction_ascent/icons/clothing/obj_feet.dmi'
	item_icons = list(
		WEAR_FEET = 'faction_ascent/icons/alate/onmob/onmob_shoes_alate.dmi'
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

/obj/item/clothing/gloves/combat/faction_ascent/alate/exosuit
	name = "exosuit appendages"
	desc = "Combat arms, used by Alate soldiers."
	icon = 'faction_ascent/icons/alate/onmob/onmob_gloves_alate.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HANDS = 'faction_ascent/icons/alate/onmob/onmob_gloves_alate.dmi'
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

/datum/equipment_preset/faction_ascent/alate/soldier
	name = "Bay12 | Alate | Soldier"
	idtype = null
	languages = list(LANGUAGE_ENGLISH) //Let's keep it simple for now
	faction = FACTION_ASCENT
	faction_group = (FACTION_ASCENT)
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_ascent/alate/soldier/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_ascent/alate/soldier/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	var/new_name = "Ascent Soldier ([rand(1, 9)][rand(1, 9)][rand(1, 9)])"
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/faction_ascent/alate/soldier/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_ALATE)
	new_human.body_type = "alate"

/datum/equipment_preset/faction_ascent/alate/soldier/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/carbine, WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/faction_ascent/alate/utility(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_ascent/alate/exosuit, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/faction_ascent/alate/exosuit, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/faction_ascent/alate/exosuit, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/faction_ascent/alate/exosuit, WEAR_JACKET)

/datum/equipment_preset/faction_ascent/alate/engineer
	name = "Bay12 | Alate | Engineer"
	idtype = null
	languages = list(LANGUAGE_ENGLISH) //Let's keep it simple for now
	faction = FACTION_ASCENT
	faction_group = (FACTION_ASCENT)
	uses_special_name = TRUE
	skills = /datum/skills/pfc
	flags = EQUIPMENT_PRESET_START_OF_ROUND

/datum/equipment_preset/faction_ascent/alate/engineer/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/faction_ascent/alate/engineer/load_name(mob/living/carbon/human/new_human, randomise)
	. = ..()
	var/new_name = "Ascent Trainee ([rand(1, 9)][rand(1, 9)][rand(1, 9)])"
	new_human.change_real_name(new_human, new_name)

/datum/equipment_preset/faction_ascent/alate/engineer/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species(SPECIES_ALATE)
	new_human.body_type = "alate"

/datum/equipment_preset/faction_ascent/alate/engineer/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/ascent/pistol, WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/faction_ascent/alate/utility(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/faction_ascent/alate/utility, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots/faction_ascent/alate/utility, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/storage/faction_ascent/alate/utility, WEAR_JACKET)

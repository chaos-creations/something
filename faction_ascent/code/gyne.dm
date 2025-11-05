//SPECIES CODE
#define SPECIES_GYNE "Gyne"

/mob/living/carbon/human/ascent_gyne/Initialize(mapload, new_species = SPECIES_GYNE)
	. = ..(mapload, new_species)
	pixel_x = -5

/datum/species/ascent_gyne
	group = SPECIES_GYNE
	name = SPECIES_GYNE
	icobase = 'faction_ascent/icons/gyne/body.dmi'
	deform = 'faction_ascent/icons/gyne/body.dmi'
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
	blood_color = LIGHT_COLOR_CYAN
	uses_skin_color = FALSE
	speech_sounds = list('faction_ascent/sounds/ascent1.ogg','faction_ascent/sounds/ascent2.ogg','faction_ascent/sounds/ascent3.ogg',
						'faction_ascent/sounds/ascent4.ogg','faction_ascent/sounds/ascent5.ogg', 'faction_ascent/sounds/ascent6.ogg')
	speech_chance = 100

	slowdown = 0.5 //тяжёлая хуёвина
	total_health = 200 //но гораздо толще

	brute_mod = 1
	burn_mod = 0.02

	bloodsplatter_type = /obj/effect/temp_visual/dir_setting/bloodsplatter/kharmaani

/datum/species/ascent_gyne/handle_post_spawn(mob/living/carbon/human/H)
	H.universal_speak = TRUE
	H.universal_understand = TRUE
	H.gender = PLURAL

	return ..()

/datum/species/ascent_gyne/handle_on_fire(humanoidmob)
	. = ..()
	INVOKE_ASYNC(humanoidmob, TYPE_PROC_REF(/mob, emote), pick("pain", "scream"))

//SPECIES EQUIPMENT

// Combat Exosuit
/obj/item/clothing/under/rank/faction_ascent/gyne
	name = "Strange-shaped undersuit"
	desc = "It almost doesn't cover anything."
	icon = 'faction_ascent/icons/gyne/onmob/onmob_under_gyne.dmi'
	icon_state = "ascent_s"
	item_state = "ascent_s"
	worn_state = "ascent_s"
	item_icons = list(
		WEAR_BODY = 'faction_ascent/icons/gyne/onmob/onmob_under_gyne.dmi'
	)

	color = COLOR_GRAY

/obj/item/clothing/suit/armor/storage/faction_ascent/gyne/exosuit
	name = "Ascent elite combat armor"
	desc = "An heavy armored battle suit, used by Gyne Generals."
	icon = 'faction_ascent/icons/clothing/obj_suit.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_JACKET = 'faction_ascent/icons/gyne/onmob/onmob_suit_gyne.dmi'
	)

	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN
	armor_melee = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_energy = CLOTHING_ARMOR_GIGAHIGHPLUS
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGHPLUS

/obj/item/clothing/head/helmet/faction_ascent/gyne/exosuit
	name = "Ascent elite exosuit helmet"
	desc = "An armored head with large antenna's."
	icon = 'faction_ascent/icons/clothing/obj_head.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HEAD = 'faction_ascent/icons/gyne/onmob/onmob_head_gyne.dmi'
	)

	flags_armor_protection = BODY_FLAG_HEAD|BODY_FLAG_FACE|BODY_FLAG_EYES
	armor_melee = CLOTHING_ARMOR_HARDCORE
	armor_bullet = CLOTHING_ARMOR_ULTRAHIGH
	armor_laser = CLOTHING_ARMOR_HARDCORE
	armor_energy = CLOTHING_ARMOR_HARDCORE
	armor_bomb = CLOTHING_ARMOR_ULTRAHIGH

	armor_bio = CLOTHING_ARMOR_GIGAHIGH
	armor_rad = CLOTHING_ARMOR_GIGAHIGH

	armor_internaldamage = CLOTHING_ARMOR_GIGAHIGHPLUS

/obj/item/clothing/shoes/jackboots/faction_ascent/gyne/exosuit
	name = "exosuit appendages"
	desc = "Combat boots, used by Gyne Generals."
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	icon = 'faction_ascent/icons/clothing/obj_feet.dmi'
	item_icons = list(
		WEAR_FEET = 'faction_ascent/icons/gyne/onmob/onmob_shoes_gyne.dmi'
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

/obj/item/clothing/gloves/combat/faction_ascent/gyne/exosuit
	name = "exosuit appendages"
	desc = "Combat arms, used by Gyne Generals."
	icon = 'faction_ascent/icons/gyne/onmob/onmob_gloves_gyne.dmi'
	icon_state = "kexosuit_sealed"
	item_state = "kexosuit_sealed"
	item_icons = list(
		WEAR_HANDS = 'faction_ascent/icons/gyne/onmob/onmob_gloves_gyne.dmi'
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

//...

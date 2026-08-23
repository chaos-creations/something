/datum/species/guardian
	group = SPECIES_HUMAN
	name = SPECIES_GUARDIAN
	name_plural = "Guardians"
	icobase = 'icons/mob/humans/species/t_guardian.dmi'
	deform = 'icons/mob/humans/species/t_guardian.dmi'
	eyes = "blank_s"
	unarmed_type = /datum/unarmed_attack/punch
	blood_color = BLOOD_COLOR_ZOMBIE
	uses_skin_color = FALSE
	special_body_types = FALSE
	mob_flags = KNOWS_TECHNOLOGY
	flags = IS_WHITELISTED|NO_CLONE_LOSS|NO_POISON|NO_NEURO|NO_SHRAPNEL|HAS_HARDCRIT
	darksight = 20
	brute_mod = 0.5
	burn_mod = 0.8
	cold_level_1 = -1
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 500
	heat_level_2 = 1000
	heat_level_3 = 2000 //a small bit of resistance

	has_organ = list(
		"brain" = /datum/internal_organ/brain, //human brain but synthetic hearth
		"heart" = /datum/internal_organ/heart/prosthetic,
	)

	knock_down_reduction = 2.5
	stun_reduction = 2.5
	acid_blood_dodge_chance = 100

/datum/species/guardian/handle_post_spawn(mob/living/carbon/human/human)
	new/obj/item/alien_embryo/dormant(human)

/datum/species/guardian/handle_death(mob/living/carbon/human/dying_guardian, gibbed)
	playsound(get_turf(dying_guardian), "glassbreak", 25, FALSE)
	var/mob/living/carbon/xenomorph/larva/infesting_larva = locate() in dying_guardian //if a larva already exists, use it

	if(infesting_larva)
		infesting_larva.chest_burst(dying_guardian)
		return

	for(var/obj/item/alien_embryo/embryo in dying_guardian) //else if this hive's embryo already exists, convert to larva and use it
		embryo.become_larva()
		infesting_larva = locate() in dying_guardian
		break

	if(infesting_larva)
		infesting_larva.chest_burst(dying_guardian)
		return

/obj/item/alien_embryo/dormant/Initialize(mapload, ...)
	. = ..()
	stage = 6
	STOP_PROCESSING(SSobj, src)

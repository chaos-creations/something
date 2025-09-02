// DEATH ARMY

/datum/species/skeleton
	group = SPECIES_HUMAN
	name = "Skeleton"
	name_plural = "Skeletons"
	icobase = 'something/icons/r_skeleton.dmi'
	deform = 'something/icons/r_skeleton.dmi'
	eyes = "blank_s"
	pain_type = /datum/pain/human_hero
	stamina_type = /datum/stamina/none
	death_message = "falls down, their bones scattering across the floor..."
	flags = NO_BREATHE|NO_CLONE_LOSS|NO_BLOOD|NO_POISON|NO_CHEM_METABOLIZATION|NO_NEURO
	mob_inherent_traits = list(
		TRAIT_EMOTE_CD_EXEMPT,
		TRAIT_FOREIGN_BIO,
		TRAIT_SUPER_STRONG
	)
	blood_color = COLOR_OIL
	uses_skin_color = FALSE
	total_health = 300
	brute_mod = 0.4
	burn_mod = 0.1
	speech_chance  = 5
	cold_level_1 = -1  //zombies don't mind the cold
	cold_level_2 = -1
	cold_level_3 = -1
	can_emote = FALSE
	knock_down_reduction = 10
	stun_reduction = 10
	knock_out_reduction = 5
	has_organ = list()

/datum/species/skeleton/handle_post_spawn(mob/living/carbon/human/owner)
	owner.universal_speak = TRUE
	owner.universal_understand = TRUE
	owner.gender = PLURAL

	owner.h_style = "Bald"
	owner.f_style = "Shaved"

/datum/species/skeleton/apply_signals(mob/living/carbon/human/H)
	RegisterSignal(H, COMSIG_HUMAN_IMPREGNATE, PROC_REF(cancel_impregnate), TRUE)

/datum/species/skeleton/proc/cancel_impregnate(datum/source)
	SIGNAL_HANDLER
	return COMPONENT_NO_IMPREGNATE

/datum/species/skeleton/handle_death(mob/living/carbon/human/H)
	for(var/obj/limb/limb in H.limbs)
		limb.droplimb(0, 0)
	qdel(H)

/datum/human_ai_equipment_preset/skeletons
	faction = FACTION_UNDEAD

/datum/equipment_preset/upp/rifleman/undead
	name = "UPP Soldier (Undead)"
	faction = FACTION_UNDEAD
	faction_group = FACTION_UNDEAD

/datum/equipment_preset/upp/rifleman/undead/load_id(mob/living/carbon/human/new_human)
	new_human.faction = faction
	new_human.faction_group = faction_group

/datum/equipment_preset/upp/rifleman/undead/load_race(mob/living/carbon/human/new_human, client/mob_client)
	new_human.set_species("Skeleton")
	new_human.body_type = "skeleton"

/datum/human_ai_equipment_preset/skeletons/dead_upp_rifleman
	name = "Undead UPP Rifleman"
	desc = "Long-dead soldier."
	path = /datum/equipment_preset/upp/rifleman/undead

/datum/human_ai_squad_preset/scav
	faction = FACTION_SCAV

/datum/human_ai_squad_preset/scav/pistol_patrol
	name = "Scavs, Pistol Patrol"
	desc = "A poorly-equipped two scavs that never has armor. Uses either a L54, VP70, or Holdout pistol. Only sometimes has meds."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/pistol = 2
	)

/datum/human_ai_squad_preset/scav/rifle_patrol
	name = "Scavs, Rifle Patrol"
	desc = "A regular scav that has basic armor and sometimes has a helmet and his friend with pistol. Uses a MAR-40, MAR-30, MAC-15, Uzi, or MP5."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/rifle = 1,
		/datum/equipment_preset/scav/pistol = 1
	)

/datum/human_ai_squad_preset/scav/shotgun_patrol
	name = "Scavs, Shotgun Patrol"
	desc = "A close-quarters scav that has basic armor and sometimes has a helmet and his friend with pistol. Uses either a Spearhead Rival 78, MOU53, or Olympiets shotgun."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/shotgun = 1,
		/datum/equipment_preset/scav/pistol = 1
	)

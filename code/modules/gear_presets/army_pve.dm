/datum/equipment_preset/army
	name = "US Army (Platoon)"
	faction = FACTION_ARMY
	faction_group = FACTION_LIST_UA
	languages = list(LANGUAGE_ENGLISH)
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	idtype = /obj/item/card/id/dogtag

// trooper
/datum/equipment_preset/uscm/army/trooper
	name = "US Army (Platoon), Trooper"
	assignment = JOB_ARMY_TROOPER
	rank = JOB_ARMY_TROOPER
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "TRPR"
	access = list(ACCESS_MARINE_PREP)
	skills = /datum/skills/trooper

// machinegunner
/datum/equipment_preset/uscm/army/gunner
	name = "US Army (Platoon), Gunner"
	assignment = JOB_ARMY_GUNNER
	rank = JOB_ARMY_GUNNER
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "L-Gnr"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SMARTPREP)
	skills = /datum/skills/trooper // trooper with a big gun, no fancy skills

// grenadier
/datum/equipment_preset/uscm/army/grenadier
	name = "US Army (Platoon), Grenadier"
	assignment = JOB_ARMY_PROPIPE
	rank = JOB_ARMY_PROPIPE
	paygrades = list(PAY_SHORT_AE2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "GRDR"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	skills = /datum/skills/trooper // trooper with boomstick

// marksman
/datum/equipment_preset/uscm/army/marksman
	name = "US Army (Platoon), Designated Marksman"
	assignment = JOB_ARMY_MARKSMAN
	rank = JOB_ARMY_MARKSMAN
	paygrades = list(PAY_SHORT_AE3 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "DM"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_SPECPREP)
	skills = /datum/skills/trooper // trooper but with a scoped rifle

// engi
/datum/equipment_preset/uscm/army/engi
	name = "US Army (Platoon), Combat Engineering Technician"
	assignment = JOB_ARMY_ENGI
	rank = JOB_ARMY_ENGI
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CET"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_ENGPREP)
	skills = /datum/skills/sapper

// medic
/datum/equipment_preset/uscm/army/medic
	name = "US Army (Platoon), Combat Medical Technician"
	assignment = JOB_ARMY_MEDIC
	rank = JOB_ARMY_MEDIC
	paygrades = list(PAY_SHORT_AE4E = JOB_PLAYTIME_TIER_0)
	role_comm_title = "CMT"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MEDPREP)
	skills = /datum/skills/medic

// team leader
/datum/equipment_preset/uscm/army/tl
	name = "US Army (Platoon), Fireteam Leader"
	assignment = JOB_ARMY_NCO
	rank = JOB_ARMY_NCO
	paygrades = list(PAY_SHORT_AE5 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "FTL"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_COMMAND, ACCESS_MARINE_TL_PREP)
	skills = /datum/skills/nco

// squad leader
/datum/equipment_preset/uscm/army/sl
	name = "US Army (Platoon), Squad Leader"
	assignment = JOB_ARMY_SNCO
	rank = JOB_ARMY_SNCO
	paygrades = list(PAY_SHORT_AE7 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "SL"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_COMMAND, ACCESS_MARINE_LEADER)
	skills = /datum/skills/snco

// staff officer
/datum/equipment_preset/uscm/army/commander
	name = "US Army (Platoon), Platoon Officer"
	assignment = JOB_ARMY_LT
	rank = JOB_ARMY_LT
	paygrades = list(PAY_SHORT_AO2 = JOB_PLAYTIME_TIER_0)
	role_comm_title = "PltOff"
	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_COMMAND, ACCESS_MARINE_SEA)
	skills = /datum/skills/lt

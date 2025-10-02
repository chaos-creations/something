//taipei baron STATUS: ELIMINATED

/obj/item/clothing/head/helmet/marine/veteran/scavs
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make these keep their name and icon.
	icon = 'something/icons/head_obj.dmi'
	item_icons = list(
		WEAR_HEAD = 'something/icons/head_mob.dmi'
	)
	built_in_visors = list()

/obj/item/clothing/suit/storage/marine/veteran/scavs
	flags_marine_armor = ARMOR_LAMP_OVERLAY
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make these keep their name and icon.
	icon = 'something/icons/suit_obj.dmi'
	item_icons = list(
		WEAR_JACKET = 'something/icons/suit_mob.dmi'
	)

/obj/item/clothing/gloves/marine/veteran/scavs
	icon = 'something/icons/gloves_obj.dmi'
	item_icons = list(
		WEAR_HANDS = 'something/icons/gloves_mob.dmi'
	)

/obj/item/clothing/under/marine/veteran/scavs
	flags_jumpsuit = FALSE
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make them keep their original name.
	icon = 'something/icons/under_obj.dmi'
	item_icons = list(
		WEAR_BODY = 'something/icons/under_mob.dmi'
	)

/obj/item/storage/belt/marine/veteran/scavs
	icon = 'something/icons/belt_obj.dmi'
	item_icons = list(
		WEAR_WAIST = 'something/icons/belt_mob.dmi'
	)

/obj/item/clothing/shoes/marine/veteran/scavs
	icon = 'something/icons/feet_obj.dmi'
	item_icons = list(
		WEAR_FEET = 'something/icons/feet_mob.dmi'
	)

/obj/item/clothing/accessory/veteran/scavs
	icon = 'something/icons/ties_obj.dmi'
	accessory_icons = list(
		WEAR_BODY = 'something/icons/ties_mob.dmi',
		WEAR_JACKET = 'something/icons/ties_mob.dmi'
	)

/obj/item/clothing/head/helmet/marine/veteran/scavs/baron
	name = "Baron Helmet"
	desc = "A heavily modified combat helmet, fitted with a reinforced faceplate and additional armor plating. The helmet is painted in a dark and tan, matte color scheme, with a distinctive emblem of a baron on the front. It is designed to provide maximum protection to the wearer in combat situations."
	icon_state = "baron"
	flags_armor_protection = BODY_FLAG_HEAD
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_inv_hide = HIDEEARS
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY

//hybrisa jaguar STATUS: ALIVE

/obj/item/clothing/head/helmet/marine/veteran/scavs/jaguar
	name = "Remnant Recon Helmet"
	desc = "Reinforced tactical helmet with a visor. Designed for long-range reconnaissance and sniper operations, offering head protection and partial air filtration. Faint scratches and dents mark the surface, evidence of prolonged field use."
	icon_state = "jaguar"
	flags_armor_protection = BODY_FLAG_HEAD
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMLOW
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE|HIDEMASK|HIDEALLHAIR
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY

/obj/item/clothing/suit/storage/marine/veteran/scavs/jaguar
	name = "\improper Remnant Combat Carapace"
	desc = "Layered composite plates bolted into a makeshift frame, offering limited protection against shrapnel and small arms fire. Each piece shows signs of crude field repairs; oil smears and blood stains suggest multiple owners before the current one."
	icon_state = "jaguar"
	armor_bullet = CLOTHING_ARMOR_HIGH
	armor_energy = CLOTHING_ARMOR_LOW
	armor_bomb = CLOTHING_ARMOR_MEDIUMLOW
	armor_rad = CLOTHING_ARMOR_LOW
	storage_slots = 3
	slowdown = SLOWDOWN_ARMOR_LIGHT
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	flags_marine_armor = null
	light_power = 0.8
	light_range = 3
	light_color = "#00f4ff"
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/tank/emergency_oxygen,
		/obj/item/device/flashlight,
		/obj/item/ammo_magazine/,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/explosive/grenade,
		/obj/item/storage/bible,
		/obj/item/weapon/sword/machete,
		/obj/item/attachable/bayonet,
		/obj/item/device/motiondetector,
		/obj/item/device/walkman,
		/obj/item/storage/belt/marine,
		/obj/item/storage/belt/medical,
		/obj/item/storage/belt/gun,
		/obj/item/storage/backpack/general_belt,
		/obj/item/storage/belt/gun/flaregun,
	)
	item_state_slots = list(WEAR_JACKET = "jaguar")

/obj/item/clothing/gloves/marine/veteran/scavs/jaguar
	name = "\improper Reinforced Tactical Gloves"
	desc = "Thick combat gloves with reinforced knuckle plating and rubberized grip. Built to maintain precision when handling a sniper rifle while still shielding hands from shrapnel and burns."
	icon_state = "jaguar"
	item_state = "jaguar"
	siemens_coefficient = 0
	armor_melee = CLOTHING_ARMOR_MEDIUMHIGH
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_laser = CLOTHING_ARMOR_VERYLOW
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUMHIGH

/obj/item/clothing/under/marine/veteran/scavs/jaguar
	name = "\improper Tactical Undersuit"
	desc = "A tight, durable bodysuit worn under armor and cloak. Resistant to tearing and heat, it provides a balance of mobility and protection, keeping the sniper combat-ready in harsh conditions."
	icon_state = "jaguar"
	worn_state = "jaguar"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_jumpsuit = UNIFORM_SLEEVE_ROLLABLE|UNIFORM_SLEEVE_CUTTABLE|UNIFORM_JACKET_REMOVABLE
	armor_internaldamage = CLOTHING_ARMOR_MEDIUM

/obj/item/clothing/shoes/marine/veteran/scavs/jaguar
	name = "\improper Remnant Combat Boots"
	desc = "Heavy-duty tactical boots reinforced with steel toes and shock-absorbing soles. Caked with dried mud and blood, they bear the weight of countless marches across ruined cities and war-torn wastelands."
	icon_state = "jaguar"
	item_state = "jaguar"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_MEDIUMLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_LOW
	min_cold_protection_temperature = SHOE_MIN_COLD_PROT
	max_heat_protection_temperature = SHOE_MAX_HEAT_PROT
	flags_cold_protection = BODY_FLAG_FEET
	flags_heat_protection = BODY_FLAG_FEET

/obj/item/clothing/shoes/marine/veteran/scavs/jaguar/knife
	spawn_item_type = /obj/item/weapon/knife/marine/sas

/obj/item/storage/belt/marine/veteran/scavs/jaguar
	name = "\improper Field Utility Belt"
	desc = "A rugged combat belt lined with pouches for ammunition and field tools. Some straps are frayed, and one pouch looks hastily patched with cloth, but it still serves its purpose: carrying the bare essentials for survival and combat."
	icon_state = "jaguar"
	item_state = "jaguar"
	storage_slots = 8
	can_hold = list(
		/obj/item
	)

/obj/item/clothing/accessory/veteran/scavs/jaguar
	name = "\improper Remnant Sniper Cloak"
	desc = "A dark cloak with a camouflaged lining, masking the wearer’s silhouette and blending into the ruins of dead worlds. Burn marks and dried blood stains cling to the fabric, silent witnesses of past engagements."
	icon_state = "jaguar"
	item_state = "jaguar"
	slot = ACCESSORY_SLOT_PONCHO

/obj/item/reagent_container/glass/minitank/jaguar/Initialize()
	. = ..()
	reagents.add_reagent("tricordrazine", 120)

/datum/equipment_preset/scav/jaguar
	name = "Jaguar, Sniper"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	skills = /datum/skills/rmc
	paygrades = list(PAY_SHORT_SCAV = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/jaguar/get_assignment(mob/living/carbon/human/new_human)
	return "Remnant Sniper"

/datum/equipment_preset/scav/jaguar/load_gear(mob/living/carbon/human/new_human)
	//back
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/M42A(new_human), WEAR_BACK)
	//uniform
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/scavs/jaguar(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/waist(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower/automag/tactical(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/twe, WEAR_ACCESSORY)
	//helmet
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/scavs/jaguar(new_human), WEAR_HEAD)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/veteran/scavs/jaguar(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/highpower(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/family_photo(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/prop/almayer/jaguar_book(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector/hacked/twe(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/veteran/scavs/jaguar(new_human), WEAR_ACCESSORY)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/veteran/scavs/jaguar(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator/spotter(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/twe(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/book/codebook/twe(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/gunoil(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/glass/minitank/jaguar(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/tricord/skillless(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/cautery(new_human), WEAR_IN_BELT)
	//boots
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/veteran/scavs/jaguar/knife(new_human), WEAR_FEET)
	//gloves
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/scavs/jaguar(new_human), WEAR_HANDS)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/first_responder/rmc, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/stack/medical/advanced/bruise_pack/upgraded, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/blood/OMinus, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/blood/saline, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/incendiary, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/flak, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/basic, WEAR_IN_R_STORE)

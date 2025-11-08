/datum/ammo/energy/scg
	name = "laser bolt"
	icon_state = "laser_new"
	flags_ammo_behavior = AMMO_LASER
	damage = 200
	accurate_range = 16
	effective_range_max = 7
	max_range = 24
	shell_speed = AMMO_SPEED_TIER_8
	scatter = SCATTER_AMOUNT_NONE
	accuracy = HIT_ACCURACY_TIER_MAX
	damage_falloff = DAMAGE_FALLOFF_TIER_10

/obj/item/weapon/gun/energy/scg_lasergun
	name = "EXP-008-S \"LASCANNON\""
	desc = "Experimental SolGov energy weaponry. A rare sight those days."
	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY

	ammo = /datum/ammo/energy/scg
	w_class = SIZE_HUGE
	charge_cost = 1000

	muzzleflash_iconstate = "muzzle_laser"
	muzzle_flash_color = COLOR_RED

	icon = 'faction_scggcc/icons/weapons_inv.dmi'
	icon_state = "experimental_egun"
	item_state = "experimental_egun"
	item_icons = list(
		WEAR_L_HAND = 'faction_scggcc/icons/weapons_onmob_l.dmi',
		WEAR_R_HAND = 'faction_scggcc/icons/weapons_onmob_r.dmi',
		)
	charge_icon = "experimental_egun"

/obj/item/weapon/gun/energy/scg_lasergun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_1)
	scatter = SCATTER_AMOUNT_NONE

	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_10
	accuracy_mult_unwielded = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_10

/obj/item/weapon/gun/faction_scggcc/pistol
	name = "LP-01 \"Elpi\" (.50)"
	desc = "Bulky but still pretty practicle."
	icon = 'faction_scggcc/icons/weapons_inv.dmi'
	icon_state = "elpi"
	item_state = "elpi"
	force = MELEE_FORCE_WEAK
	w_class = SIZE_MEDIUM
	flags_equip_slot = SLOT_WAIST
	item_icons = list(
		WEAR_L_HAND = 'faction_scggcc/icons/weapons_onmob_l.dmi',
		WEAR_R_HAND = 'faction_scggcc/icons/weapons_onmob_r.dmi',
		)
	flags_atom = FPRINT|NOBLOODY|CONDUCT
	movement_onehanded_acc_penalty_mult = 3
	wield_delay = WIELD_DELAY_VERY_FAST

	current_mag = /obj/item/ammo_magazine/faction_scggcc/pistol

	fire_sound = "vp70"

	reload_sound = 'sound/weapons/flipblade.ogg'
	cocked_sound = 'sound/weapons/gun_pistol_cocked.ogg'
	empty_sound = 'sound/weapons/gun_empty.ogg'

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED
	gun_category = GUN_CATEGORY_HANDGUN

/obj/item/weapon/gun/faction_scggcc/pistol/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_3

/obj/item/ammo_magazine/faction_scggcc/pistol
	name = "\improper Pistol Magazine (.50)"
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/twe_ammo.dmi'
	icon_state = "rmcdmr"
	default_ammo = /datum/ammo/bullet/pistol/deagle
	max_rounds = 12
	caliber = ".50"
	gun_type = /obj/item/weapon/gun/faction_scggcc/pistol

/obj/item/weapon/gun/faction_scggcc/rifle
	name = "AR-17 \"French\" (10x24mm)"
	desc = "A dependable, hefty weapon. Looks like FAMAS, but also isn't."

	icon = 'faction_scggcc/icons/weapons_inv.dmi'
	icon_state = "rifle"
	item_state = "rifle"
	item_icons = list(
		WEAR_L_HAND = 'faction_scggcc/icons/weapons_onmob_l.dmi',
		WEAR_R_HAND = 'faction_scggcc/icons/weapons_onmob_r.dmi',
		)
	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/faction_scggcc/rifle

	fire_sound = 'sound/weapons/gun_ar10.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_ar10_unload.ogg'
	cocked_sound = 'sound/weapons/handling/gun_ar10_cocked.ogg'

	wield_delay = WIELD_DELAY_VERY_FAST

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_RIFLE

	start_semiauto = TRUE

	attachable_allowed = list()

/obj/item/weapon/gun/faction_scggcc/rifle/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/faction_scggcc/rifle/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_5
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_5
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/faction_scggcc/rifle
	name = "Rifle Magazine (10x24mm)"
	icon_state = "m49a"
	caliber = "10x24mm"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/rifle
	max_rounds = 33
	gun_type = /obj/item/weapon/gun/faction_scggcc/rifle

/obj/item/weapon/gun/shotgun/combat/faction_scggcc_variant
	name = "\improper BS-110 \"Shortie\""
	desc = "For close combat encounters. An most optimal weapon there in the trenches."
	icon = 'faction_scggcc/icons/weapons_inv.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	item_icons = list(
		WEAR_L_HAND = 'faction_scggcc/icons/weapons_onmob_l.dmi',
		WEAR_R_HAND = 'faction_scggcc/icons/weapons_onmob_r.dmi',
		)

/obj/item/weapon/gun/shotgun/combat/faction_scggcc_variant/set_gun_config_values()
	..()
	starting_attachment_types = list()

/datum/ammo/energy/scg
	name = "laser bolt"
	icon_state = "laser_new"
	flags_ammo_behavior = AMMO_LASER
	damage = 200
	accurate_range = 20
	effective_range_max = 30
	max_range = 40
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

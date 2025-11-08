// Tajaran Armory

//MILITIA PISTOL//
/obj/item/weapon/gun/faction_ascent/taj/militia/pistol/regular
	name = "Ash'ain-Pattern Pistol (7.97)"
	desc = "Very simple in design, but still very practical Militia pistol, used by most of Tajaran troops."
	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	force = MELEE_FORCE_WEAK
	w_class = SIZE_MEDIUM
	flags_equip_slot = SLOT_WAIST
	item_icons = list(
		WEAR_L_HAND = 'bay_stuff/obj/guns/onmob/lefthand.dmi',
		WEAR_R_HAND = 'bay_stuff/obj/guns/onmob/righthand.dmi'
		)

	flags_atom = FPRINT|NOBLOODY|CONDUCT
	movement_onehanded_acc_penalty_mult = 3
	wield_delay = WIELD_DELAY_VERY_FAST

	current_mag = /obj/item/ammo_magazine/faction_ascent/taj/militia/pistol
	caliber = "7.97"

	fire_sound = "vp70"

	reload_sound = 'sound/weapons/flipblade.ogg'
	cocked_sound = 'sound/weapons/gun_pistol_cocked.ogg'
	empty_sound = 'sound/weapons/gun_empty.ogg'

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED
	gun_category = GUN_CATEGORY_HANDGUN

/obj/item/weapon/gun/faction_ascent/taj/militia/pistol/regular/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_8
	scatter_unwielded = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_3

/obj/item/ammo_magazine/faction_ascent/taj/militia/pistol
	name = "\improper Pistol Magazine (7.97)"
	caliber = "7.97"
	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "pistol_mag"
	default_ammo = /datum/ammo/bullet/pistol/faction_ascent/taj
	max_rounds = 8
	gun_type = /obj/item/weapon/gun/faction_ascent/taj/militia/pistol

/datum/ammo/bullet/pistol/faction_ascent/taj
	name = "7.97 bullet"
	damage = 50
	accurate_range = 10
	accuracy = HIT_ACCURACY_TIER_10
	scatter = SCATTER_AMOUNT_TIER_10
	shell_speed = AMMO_SPEED_TIER_3
	effective_range_max = 5
	max_range = 20
	penetration = ARMOR_PENETRATION_TIER_4

	handful_state = "lever_action_bullet"
//MILITIA PISTOL//

//OFFICER REVOLVER//
/obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer
	name = "Ash'ain-Pattern Revolver (7.97)"
	desc = "So called 'piercer' is an beutifully engineered killing machine, used by Tajaran Commissar's and high-ops."
	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "revolver"
	item_state = "revolver"
	item_icons = list(
		WEAR_L_HAND = 'bay_stuff/obj/guns/onmob/lefthand.dmi',
		WEAR_R_HAND = 'bay_stuff/obj/guns/onmob/righthand.dmi'
		)
	has_empty_icon = FALSE
	fire_sound = null
	fire_sounds = list('sound/weapons/gun_cmb_1.ogg', 'sound/weapons/gun_cmb_2.ogg')
	fire_rattle = 'sound/weapons/gun_cmb_rattle.ogg'
	unload_sound = 'sound/weapons/handling/pkd_open_chamber.ogg'
	chamber_close_sound = 'sound/weapons/handling/pkd_close_chamber.ogg'
	current_mag = /obj/item/ammo_magazine/internal/revolver/faction_ascent/taj/militia/officer
	force = MELEE_FORCE_WEAK
	attachable_allowed = list()

/obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer/click_empty(mob/user)
	if(user)
		to_chat(user, SPAN_WARNING("<b>*click*</b>"))
		playsound(user, pick('sound/weapons/handling/gun_cmb_click1.ogg', 'sound/weapons/handling/gun_cmb_click2.ogg'), 25, 1, 5)
	else
		playsound(src, pick('sound/weapons/handling/gun_cmb_click1.ogg', 'sound/weapons/handling/gun_cmb_click2.ogg'), 25, 1, 5)

/obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
	playsound('sound/weapons/gun_cmb_bass.ogg') // badass shooting bass
	return ..()

/obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_3)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT
	scatter = SCATTER_AMOUNT_TIER_10
	scatter_unwielded = SCATTER_AMOUNT_TIER_9
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_8
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_5

/obj/item/ammo_magazine/internal/revolver/faction_ascent/taj/militia/officer
	default_ammo = /datum/ammo/bullet/pistol/faction_ascent/taj
	caliber = "7.97"
	gun_type = /obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer

/obj/item/ammo_magazine/revolver/faction_ascent/taj/militia/officer
	name = "\improper Revolver speed loader (7.97)"
	desc = "An basic revolver speedloader."
	default_ammo = /datum/ammo/bullet/pistol/faction_ascent/taj
	caliber = "7.97"
	icon = 'bay_stuff/obj/ammo.dmi'
	icon_state = "38"
	max_rounds = 6
	gun_type = /obj/item/weapon/gun/revolver/faction_ascent/taj/militia/officer
//OFFICER REVOLVER//

//MILITIA CARBINE//
/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/carbine
	name = "Ash'ain-Pattern Tactical Rifle (7.97)"
	desc = "A dependable, hefty weapon. Usually not the first choice of Tajaran Militia, but the combination of heft, weight, and satisfying boom makes it worthwhile all the same."

	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "carbine"
	item_state = "carbine"
	item_icons = list(
		WEAR_L_HAND = 'bay_stuff/obj/guns/onmob/lefthand.dmi',
		WEAR_R_HAND = 'bay_stuff/obj/guns/onmob/righthand.dmi'
		)

	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/faction_ascent/taj/militia/rifle

	fire_sound = 'sound/weapons/gun_ar10.ogg'
	reload_sound = 'sound/weapons/handling/gun_m16_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_ar10_unload.ogg'
	cocked_sound = 'sound/weapons/handling/gun_ar10_cocked.ogg'

	wield_delay = WIELD_DELAY_VERY_FAST

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_RIFLE

	start_semiauto = TRUE

	attachable_allowed = list()

/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/carbine/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/carbine/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_9)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_5
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_TIER_9
	scatter_unwielded = SCATTER_AMOUNT_TIER_7
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_5
	recoil = RECOIL_OFF
	recoil_unwielded = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/faction_ascent/taj/militia/rifle
	name = "Rifle Magazine (7.97)"
	desc = "A 7.97 rifle magazine."
	caliber = "7.97"
	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "carbine_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/pistol/faction_ascent/taj
	max_rounds = 21
	gun_type = /obj/item/weapon/gun/faction_ascent/taj/militia/rifle/carbine
//MILITIA CARBINE//

//MILITIA MACHINE GUN//
/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/machinegun
	name = "Kar'ishan-Pattern Breaching LMG (12.7)"
	desc = "An heavy weapon, used to quickly clear fortified positions of the enemy."

	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "lmg"
	item_state = "lmg"
	item_icons = list(
		WEAR_L_HAND = 'bay_stuff/obj/guns/onmob/lefthand.dmi',
		WEAR_R_HAND = 'bay_stuff/obj/guns/onmob/righthand.dmi'
		)

	w_class = SIZE_LARGE
	force = MELEE_FORCE_NORMAL
	flags_atom = NOBLOODY|CONDUCT

	current_mag = /obj/item/ammo_magazine/faction_ascent/taj/militia/machinegun

	fire_sound = 'sound/weapons/gun_mar40.ogg'
	reload_sound = 'sound/weapons/handling/gun_mar40_reload.ogg'
	unload_sound = 'sound/weapons/handling/gun_mar40_unload.ogg'

	wield_delay = WIELD_DELAY_NORMAL

	flags_gun_features = GUN_AUTO_EJECTOR|GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY
	flags_item = TWOHANDED
	gun_category = GUN_CATEGORY_HEAVY

	start_automatic = TRUE
	aim_slowdown = SLOWDOWN_ADS_LMG

	attachable_allowed = list()

/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/machinegun/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/faction_ascent/taj/militia/rifle/machinegun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	accuracy_mult = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_2
	scatter = SCATTER_AMOUNT_TIER_6
	damage_mult = BASE_BULLET_DAMAGE_MULT + BULLET_DAMAGE_MULT_TIER_2
	recoil = RECOIL_AMOUNT_TIER_4

/obj/item/ammo_magazine/faction_ascent/taj/militia/machinegun
	name = "MG Magazine (12.7)"
	desc = "A 12.7 machine gun magazine."
	caliber = "12.7"
	icon = 'bay_stuff/obj/guns/tajaran_armory.dmi'
	icon_state = "lmg_mag"
	w_class = SIZE_MEDIUM
	default_ammo = /datum/ammo/bullet/pistol/faction_ascent/taj/heavy
	max_rounds = 130
	gun_type = /obj/item/weapon/gun/faction_ascent/taj/militia/rifle/machinegun

/datum/ammo/bullet/pistol/faction_ascent/taj/heavy
	name = "12.7 bullet"
	damage = 80
	accurate_range = 15
	accuracy = HIT_ACCURACY_TIER_8
	scatter = SCATTER_AMOUNT_TIER_8
	shell_speed = AMMO_SPEED_TIER_6
	effective_range_max = 10
	max_range = 30
	penetration = ARMOR_PENETRATION_TIER_8

// Ascents

/datum/firearm_appraisal/energy_ascent
	gun_types = list(/obj/item/weapon/gun/energy/ascent)
	disposable = TRUE
	primary_weight = 10

/datum/ammo/energy/ascent
	name = "laser bolt"
	icon_state = "omnilaser_new"
	flags_ammo_behavior = AMMO_LASER
	damage = 60
	accurate_range = 20
	effective_range_max = 30
	max_range = 40
	shell_speed = AMMO_SPEED_TIER_8
	scatter = SCATTER_AMOUNT_NONE
	accuracy = HIT_ACCURACY_TIER_10
	damage_falloff = DAMAGE_FALLOFF_TIER_10

/datum/ammo/energy/ascent/explosive
	damage = 100
	shell_speed = AMMO_SPEED_TIER_6
	accuracy = HIT_ACCURACY_TIER_8

	flags_ammo_behavior = AMMO_EXPLOSIVE|AMMO_ENERGY|AMMO_ROCKET|AMMO_STRIKES_SURFACE

/datum/ammo/energy/ascent/explosive/set_bullet_traits()
	. = ..()
	LAZYADD(traits_to_give, list(
		BULLET_TRAIT_ENTRY(/datum/element/bullet_trait_incendiary)
	))

/datum/ammo/energy/ascent/explosive/drop_flame(turf/turf, datum/cause_data/cause_data)
	playsound(turf, 'sound/weapons/gun_flamethrower3.ogg', 75, 1, 7)
	if(!istype(turf)) return
	var/datum/reagent/napalm/blue/reagent = new()
	new /obj/flamer_fire(turf, cause_data, reagent, 3)

/datum/ammo/energy/ascent/explosive/on_hit_mob(mob/mob, obj/projectile/projectile)
	if(iscarbon(mob)) // Doesn't matter how built-different you are, it's an explosive rocket-propelled projectile hitting you.
		mob.ex_act(650, null, projectile.weapon_cause_data, 100)
	cell_explosion(get_turf(mob), 250, 40, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)
	drop_flame(get_turf(mob), projectile.weapon_cause_data)

/datum/ammo/energy/ascent/explosive/on_hit_obj(obj/object, obj/projectile/projectile)
	cell_explosion(get_turf(object), 250, 40, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)
	drop_flame(get_turf(object), projectile.weapon_cause_data)

/datum/ammo/energy/ascent/explosive/on_hit_turf(turf/turf, obj/projectile/projectile)
	cell_explosion(turf, 250, 40, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)
	drop_flame(get_turf(turf), projectile.weapon_cause_data)

/datum/ammo/energy/ascent/explosive/do_at_max_range(obj/projectile/projectile)
	cell_explosion(get_turf(projectile), 250, 40, EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL, null, projectile.weapon_cause_data)
	drop_flame(get_turf(projectile), projectile.weapon_cause_data)

/obj/item/weapon/gun/energy/ascent
	ammo = /datum/ammo/energy/ascent
	w_class = SIZE_MEDIUM
	charge_cost = 100

	muzzleflash_iconstate = "muzzle_flash_blue"
	muzzle_flash_color = COLOR_CYAN

	icon = 'faction_ascent/icons/weapons_inv.dmi'
	icon_state = "pistol"
	item_state = "pistol"
	item_icons = list(
		WEAR_L_HAND = 'faction_ascent/icons/weapons_onmob_l.dmi',
		WEAR_R_HAND = 'faction_ascent/icons/weapons_onmob_r.dmi',
		)
	charge_icon = "pistol"

	var/self_charging = FALSE
	var/charging = FALSE

/obj/item/weapon/gun/energy/ascent/Initialize(mapload, spawn_empty)
	. = ..()
	if(self_charging)
		START_PROCESSING(SSobj, src)

/obj/item/weapon/gun/energy/ascent/process()
	if(cell.charge <= 0 & !charging)
		charging = TRUE
		add_filter("recharge_outline", 1, list("type" = "outline", "color" = "#67fce8", "size" = 1))
		add_filter("recharge_blur", 1, list("type" = "blur", "size" = 1))
		color = "#67fce8"
		addtimer(CALLBACK(src, PROC_REF(restore_energy)), 5 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/item/weapon/gun/energy/ascent/proc/restore_energy()
	remove_filter("recharge_outline")
	remove_filter("recharge_blur")
	color = COLOR_WHITE

	cell.charge = cell.maxcharge
	charging = FALSE

/obj/item/weapon/gun/energy/ascent/pistol
	name = "Ascent E-Gun"
	desc = "An standart energy weapon, issued to every alate worker and soldier."
	charge_cost = 500

	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_CAN_POINTBLANK|GUN_ONE_HAND_WIELDED
	flags_equip_slot = SLOT_WAIST

	self_charging = TRUE

/obj/item/weapon/gun/energy/ascent/pistol/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_6)
	scatter = SCATTER_AMOUNT_NONE

	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6
	accuracy_mult_unwielded = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_6

/obj/item/weapon/gun/energy/ascent/carbine
	name = "Ascent E-Rifle"
	desc = "An more complex version of energy pistol, used on long range. Pretty light for it's size."
	charge_cost = 200

	icon_state = "carbine"
	item_state = "carbine"
	charge_icon = "carbine"

	wield_delay = WIELD_DELAY_NORMAL
	start_semiauto = FALSE
	start_burstfire = TRUE

	self_charging = TRUE

/obj/item/weapon/gun/energy/ascent/carbine/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SMG2)
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_SMG2)
	scatter_unwielded = SCATTER_AMOUNT_TIER_4

/obj/item/weapon/gun/energy/ascent/machinegun
	name = "Ascent Destroyer"
	desc = "Heavy looking energy-based rotary gun, able to provide so viable support to other members of the group."
	charge_cost = 50

	icon_state = "machinegun"
	item_state = "machinegun"
	charge_icon = "machinegun"

	wield_delay = WIELD_DELAY_SLOW
	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY
	start_semiauto = FALSE
	start_automatic = TRUE

	w_class = SIZE_LARGE

/obj/item/weapon/gun/energy/ascent/machinegun/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_SG)
	scatter = SCATTER_AMOUNT_NONE
	burst_scatter_mult = SCATTER_AMOUNT_NONE
	scatter_unwielded = SCATTER_AMOUNT_TIER_4
	damage_mult = BULLET_DAMAGE_MULT_TIER_6

	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_1

/obj/item/weapon/gun/energy/ascent/launcher
	name = "Ascent Plasmas Launcher"
	desc = "Heavy looking energy-based launcher, used to melt vehicle."

	icon_state = "gl"
	item_state = "gl"
	charge_icon = "gl"

	wield_delay = WIELD_DELAY_SLOW
	flags_gun_features = GUN_UNUSUAL_DESIGN|GUN_CAN_POINTBLANK|GUN_WIELDED_FIRING_ONLY

	ammo = /datum/ammo/energy/ascent/explosive
	w_class = SIZE_LARGE
	charge_cost = 5000

/obj/item/weapon/gun/energy/ascent/launcher/set_gun_config_values()
	set_fire_delay(FIRE_DELAY_TIER_1)
	scatter = SCATTER_AMOUNT_NONE

/obj/item/weapon/sword/machete/ascent/energy_axe
	name = "\improper energy axe"
	desc = "Strong and noble weapon."
	icon = 'faction_ascent/energy.dmi'
	icon_state = "halberdblue"
	item_state = "halberdblue"
	item_icons = list(
		WEAR_L_HAND = 'faction_ascent/polearms_lefthand.dmi',
		WEAR_R_HAND = 'faction_ascent/polearms_righthand.dmi',
		)

	force = 80

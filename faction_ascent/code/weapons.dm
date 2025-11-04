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
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
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
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
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
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4
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
	accuracy_mult = BASE_ACCURACY_MULT
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

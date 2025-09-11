//taipei baron

/obj/item/clothing/head/helmet/marine/veteran/scavs
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE //Let's make these keep their name and icon.
	icon = 'something/icons/head_obj.dmi'
	item_icons = list(
		WEAR_HEAD = 'something/icons/head_mob.dmi'
	)
	built_in_visors = list()

/obj/item/clothing/head/helmet/marine/veteran/scavs/baron
	name = "Baron Helmet"
	desc = "A heavily modified combat helmet, fitted with a reinforced faceplate and additional armor plating. The helmet is painted in a dark and tan, matte color scheme, with a distinctive emblem of a baron on the front. It is designed to provide maximum protection to the wearer in combat situations."
	icon_state = "baron"
	armor_bullet = CLOTHING_ARMOR_MEDIUMHIGH
	armor_energy = CLOTHING_ARMOR_MEDIUMLOW
	armor_bomb = CLOTHING_ARMOR_MEDIUM
	armor_bio = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_inv_hide = HIDEEARS
	flags_marine_helmet = HELMET_DAMAGE_OVERLAY|HELMET_GARB_OVERLAY

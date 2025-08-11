/obj/structure/roof/inaks_decor
	name = "crosswalk sign"
	icon = 'something/icons/inaks_decorations.dmi'
	icon_state = "crosswalk_sign"
	anchored = TRUE
	density = FALSE
	mouse_opacity = FALSE
	layer = INTERIOR_ROOF_LAYER

/obj/structure/roof/inaks_decor/Initialize()
	var/image/source_image = image(icon, icon_state = "[icon_state]-s")
	source_image.pixel_y = -32
	source_image.plane = FLOOR_PLANE
	source_image.layer = ANIMAL_HIDING_LAYER
	overlays += source_image

	return ..()

/obj/structure/roof/inaks_decor/turn_sign
	name = "road turn sign"
	icon_state = "turn_sign"

/obj/structure/roof/inaks_decor/turn_sign/south
	dir = SOUTH

/obj/structure/roof/inaks_decor/turn_sign/west
	dir = WEST

/obj/structure/roof/inaks_decor/turn_sign/north
	dir = NORTH

/obj/structure/roof/inaks_decor/turn_sign/east
	dir = EAST

/obj/structure/roof/inaks_decor/lamppost
	name = "lamppost"
	icon_state = "lamppost"

/obj/structure/roof/inaks_decor/lamppost/south
	dir = SOUTH

/obj/structure/roof/inaks_decor/lamppost/west
	dir = WEST

/obj/structure/roof/inaks_decor/lamppost/north
	dir = NORTH

/obj/structure/roof/inaks_decor/lamppost/east
	dir = EAST

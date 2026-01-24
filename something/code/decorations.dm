
/turf/open/floor/almayer_hull/corner
	name = "corner"
	icon = 'something/icons/turfs.dmi'
	icon_state = "get"

/turf/open/floor/almayer_hull/corner/northeast
	dir = NORTHEAST

/turf/open/floor/almayer_hull/corner/northwest
	dir = NORTHWEST

/turf/open/floor/almayer_hull/corner/southeast
	dir = SOUTHEAST

/turf/open/floor/almayer_hull/corner/southwest
	dir = SOUTHWEST

/turf/open/floor/almayer_hull/glass
	name = "glass floor"
	icon = 'something/icons/turfs.dmi'
	icon_state = "glass"

/turf/open/floor/almayer_hull/glass/Initialize(mapload, ...)
	ADD_TRAIT(src, TURF_Z_TRANSPARENT_TRAIT, TRAIT_SOURCE_INHERENT)

	. = ..()

/turf/close/radio
	name = "distant noise"
	desc = "In these days, electrical noise follows people everywhere. Not always intelligible, but always unstoppable. It is like radio interference. It seems to intensify as it approaches the boundary of known space. Sometimes you can make out words in the noise. A strange whisper that makes no sense."
	icon = 'something/icons/turfs.dmi'
	icon_state = "noise1"
	density = TRUE
	opacity = 1
	minimap_color = MINIMAP_SOLID

/turf/close/radio/Initialize(mapload, ...)
	. = ..()
	icon_state = "noise[rand(1,3)]"

/turf/close/radio/noise1
	icon_state = "noise1"

/turf/close/radio/noise2
	icon_state = "noise2"

/turf/close/radio/noise3
	icon_state = "noise3"

/turf/open/floor/corsat/spiral_other
	icon = 'something/icons/turfs.dmi'
	icon_state = "spiral_other"
	light_color = "#e7c0a4"
	light_on = 1
	light_power = 2
	light_range = 4

/turf/open/floor/strata/liberty
	icon = 'something/icons/turfs.dmi'
	icon_state = "strata_catwalk_broken"

/obj/structure/prop/almayer/liberty/deck_turret
	name = "\improper deck turret"
	desc = "A deck turret from the Liberty-class frigate."
	icon = 'something/icons/deck_turret.dmi'
	icon_state = "deck_turret"
	bound_width = 128
	bound_height = 128
	unslashable = TRUE
	unacidable = TRUE

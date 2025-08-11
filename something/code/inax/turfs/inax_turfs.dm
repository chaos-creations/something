//WHY THERE ARE TWO DIFFERENT KINDS OF TURFS HERE WHAT THE ACTUAL FUCJ

/turf/open/floor/inaks
	icon = 'something/icons/inaks_turfs.dmi'

/* /turf/open/floor/inaks/Initialize() //for cadaab
	.=..()
	set_light(1, 1, 5, l_color = "#FF9D8E")
*/

/turf/open/floor/inaks/asphalt
	name = "asphalt"
	icon_state = "asphalt"

/turf/open/floor/inaks/plate
	name = "plate"
	icon_state = "plate"

/turf/open/floor/inaks/cubic_plate
	name = "cubic plate"
	icon_state = "cubic_plate"

/turf/open/floor/inaks/dark_cafel
	name = "dark cafel"
	icon_state = "dark_cafel"

/turf/open/floor/inaks/roof
	name = "dark roof"
	icon_state = "roof0"

/turf/open/floor/inaks/roof/Initialize(mapload, ...)
	. = ..()
	icon_state = "roof[rand(0,3)]"

/turf/open/floor/inaks/roof/roof0
	icon_state = "roof0"

/turf/open/floor/inaks/roof/roof1
	icon_state = "roof1"

/turf/open/floor/inaks/roof/roof2
	icon_state = "roof2"

/turf/open/floor/inaks/roof/roof3
	icon_state = "roof3"

// cadaab turfs

/turf/close/cadaab
	name = "distant noise"
	desc = "In these days, electrical noise follows people everywhere. Not always intelligible, but always unstoppable. It is like radio interference. It seems to intensify as it approaches the boundary of known space. Sometimes you can make out words in the noise. A strange whisper that makes no sense."
	icon = 'something/icons/turfs.dmi'
	icon_state = "noise1"
	density = TRUE
	opacity = 1
	minimap_color = MINIMAP_SOLID

/turf/close/cadaab/Initialize(mapload, ...)
	. = ..()
	icon_state = "noise[rand(1,3)]"

/turf/close/cadaab/noise1
	icon_state = "noise1"

/turf/close/cadaab/noise2
	icon_state = "noise2"

/turf/close/cadaab/noise3
	icon_state = "noise3"

/turf/close/cadaab/rock
	name = "impassable rock"
	desc = "It's a particularly tough rock here."
	icon_state = "rock0"
	minimap_color = MINIMAP_SOLID

/turf/close/cadaab/rock/Initialize(mapload, ...)
	. = ..()
	icon_state = "rock[rand(0,1)]"

/turf/close/cadaab/rock/rock0
	icon_state = "rock0"

/turf/close/cadaab/rock/rock1
	icon_state = "rock1"

/turf/open/gm/cadaab
	name = "stone"
	desc = "Guess you could call it a RED STONE."
	icon = 'something/icons/turfs.dmi'
	icon_state = "stone0"
	minimap_color = MINIMAP_MARS_DIRT

/turf/open/gm/cadaab/Initialize(mapload, ...)
	. = ..()
	icon_state = "stone[rand(0,1)]"

/turf/open/gm/cadaab/stone0
	icon_state = "stone0"

/turf/open/gm/cadaab/stone1
	icon_state = "stone1"

/turf/open/gm/cadaab/road
	name = "scorched sand" // I don't know what the fuck it's called
	desc = "Guess you could call it a RED STONE."
	icon_state = "road"
	minimap_color = MINIMAP_ROAD

/turf/open/gm/cadaab/road/rock
	name = "stone road"
	icon_state = "stone_road"
	minimap_color = MINIMAP_MARS_DIRT

/turf/open/gm/cadaab/sand
	name = "sand"
	desc = "It's coarse and gets everywhere."
	icon_state = "sand0"
	minimap_color = MINIMAP_DIRT

/turf/open/gm/cadaab/sand/Initialize(mapload, ...)
	. = ..()
	icon_state = "sand[rand(0,6)]"

/turf/open/gm/cadaab/sand/sand0
	icon_state = "sand0"

/turf/open/gm/cadaab/sand/sand1
	icon_state = "sand1"

/turf/open/gm/cadaab/sand/sand2
	icon_state = "sand2"

/turf/open/gm/cadaab/sand/sand3
	icon_state = "sand3"

/turf/open/gm/cadaab/sand/sand4
	icon_state = "sand4"

/turf/open/gm/cadaab/sand/sand5
	icon_state = "sand5"

/turf/open/gm/cadaab/sand/sand6
	icon_state = "sand6"

/obj/item/stack/tile/wood/cadaab_wood
	name = "rugged wooden planks"
	desc = "Rugged wood planks."
	singular_name = "rugged wooden floor tile"
	stack_id = "rugged wooden floor tile"
	turf_type = /turf/open/floor/wood/cadaab_wood

/turf/open/floor/wood/cadaab_wood
	name = "rugged wooden floor"
	desc = "Rugged wood planks."
	icon = 'something/icons/turfs.dmi'
	icon_state = "wooden0"
	tile_type = /obj/item/stack/tile/wood/fake

/turf/open/floor/wood/cadaab_wood/Initialize(mapload, ...)
	. = ..()
	icon_state = "wooden[rand(0,3)]"

/turf/open/floor/wood/cadaab_wood/wooden0
	icon_state = "wooden0"

/turf/open/floor/wood/cadaab_wood/wooden1
	icon_state = "wooden1"

/turf/open/floor/wood/cadaab_wood/wooden2
	icon_state = "wooden2"

/turf/open/floor/wood/cadaab_wood/wooden3
	icon_state = "wooden3"


/obj/effect/spawner/random/asphalt_crack
	name = "random crack"
	desc = "This is a random crack."
	icon = 'something/icons/inaks_decals.dmi'
	icon_state = "crack_1"
	spawn_nothing_percentage = 5

/obj/effect/spawner/random/asphalt_crack/item_to_spawn()
	return pick(/obj/effect/decal/inaks/asphalt_crack_1,\
				/obj/effect/decal/inaks/asphalt_crack_2,\
				/obj/effect/decal/inaks/asphalt_crack_3,\
				/obj/effect/decal/inaks/asphalt_crack_4,\
				/obj/effect/decal/inaks/asphalt_crack_5,\
				/obj/effect/decal/inaks/asphalt_crack_6,\
				/obj/effect/decal/inaks/asphalt_crack_7,\
				/obj/effect/decal/inaks/asphalt_crack_8,\
				/obj/effect/decal/inaks/asphalt_crack_9,\
				/obj/effect/decal/inaks/asphalt_crack_10,\
				/obj/effect/decal/inaks/asphalt_crack_11,\
				/obj/effect/decal/inaks/asphalt_crack_12,\
				/obj/effect/decal/inaks/asphalt_crack_13,\
				/obj/effect/decal/inaks/asphalt_crack_14,\
				/obj/effect/decal/inaks/asphalt_crack_15,\
				/obj/effect/decal/inaks/asphalt_crack_16,\
				/obj/effect/decal/inaks/asphalt_crack_17,\
				/obj/effect/decal/inaks/asphalt_crack_18,\
				/obj/effect/decal/inaks/asphalt_crack_19,\
				/obj/effect/decal/inaks/asphalt_crack_20,\
				/obj/effect/decal/inaks/asphalt_crack_21,\
				/obj/effect/decal/inaks/asphalt_crack_22,\
				/obj/effect/decal/inaks/asphalt_crack_23,\
				/obj/effect/decal/inaks/asphalt_crack_24)

/obj/effect/spawner/random/cadaab_grass
	name = "random desert grass"
	desc = "random patch of desert grass."
	icon = 'something/icons/inaks_decals.dmi'
	icon_state = "grass0"
	spawn_nothing_percentage = 5

/obj/effect/spawner/random/cadaab_grass/item_to_spawn()
	return pick(/obj/effect/decal/inaks/grass/grass0,\
				/obj/effect/decal/inaks/grass/grass1,\
				/obj/effect/decal/inaks/grass/grass2,\
				/obj/effect/decal/inaks/grass/grass3,\
				/obj/effect/decal/inaks/grass/grass4,\
				/obj/effect/decal/inaks/grass/grass5,\
				/obj/effect/decal/inaks/grass/grass6,\
				/obj/effect/decal/inaks/grass/grass7,\
				/obj/effect/decal/inaks/grass/grass8,\
				/obj/effect/decal/inaks/grass/grass9,\
				/obj/effect/decal/inaks/grass/grass10,\
				/obj/effect/decal/inaks/grass/grass11,\
				/obj/effect/decal/inaks/grass/grass12,\
				/obj/effect/decal/inaks/grass/grass13,\
				/obj/effect/decal/inaks/grass/grass14,\
				/obj/effect/decal/inaks/grass/grass15,)

// noise tv redone //

/obj/structure/machinery/prop/almayer/computer/noisetv
	name = "transmission center"
	desc = "A device assembled from parts found on Cadaab, waiting to receive a transmission."
	icon = 'something/icons/objects.dmi'
	icon_state = "tvnoise"
	anchored = TRUE
	density = TRUE
	var/on = FALSE

/obj/structure/machinery/prop/almayer/computer/noisetv/ex_act(severity)
	switch(severity)
		if(EXPLOSION_THRESHOLD_LOW to INFINITY)
			if(prob(50))
				audible_message(SPAN_WARNING("The [src] is damaged by the explosion!"))
				on = FALSE
				update_icon()
				set_light(0)
				playsound(src, null, 0)
				addtimer(CALLBACK(src, .proc/endnoise), 1 SECONDS)
				qdel(src)
	return

/obj/structure/machinery/prop/almayer/computer/noisetv/Initialize(mapload, ...)
	. = ..()
	on = TRUE
	addtimer(CALLBACK(src, .proc/playnoise), 1)

/obj/structure/machinery/prop/almayer/computer/noisetv/power_change()
	..()
	if(stat & NOPOWER)
		if(on)
			on = FALSE
			endnoise()
	else
		if(!on)
			on = TRUE
			addtimer(CALLBACK(src, .proc/playnoise), 1)
	update_icon()

/obj/structure/machinery/prop/almayer/computer/noisetv/proc/playnoise()
	if(!on)
		return
	if(QDELETED(src) || !on)
		return

	playsound(src, pick('something/sounds/noise.ogg', 'something/sounds/noise2.ogg','something/sounds/noise3.ogg'), 50)
	if(prob(10))
		var/phrase_1 = pick("A victorious day", "The Day of Mourning", "Great event", "The-e-e-e-e", "A new decision has been made", "A measure of necessity")
		var/phrase_2 = pick("Boris Booker", "Gensek Goodman", "Lord-Regent", "Lord-Protector", "Hub Council", "Syndicate Dirrectors", "Alliance of Humanity High Consulate", "Frau Marta")
		var/phrase_3 = pick("Name it Fiolet Danger", "Danger of rebuilding vox Empire", "Status of Mirania", "Last tajaras", "Strange fleet Ellipse", "Not repeat the era of Silence", "New warlord", "Recover of the Patriots", "Strange signals from deep space")
		visible_message(SPAN_LARGE("Noise-covered voices come from the [src]: '[phrase_1]... [phrase_2]... [phrase_3]'"))
	if(on)
		addtimer(CALLBACK(src, .proc/playnoise), 7 SECONDS)

/obj/structure/machinery/prop/almayer/computer/noisetv/proc/endnoise()
	playsound(src, null, 0)
	set_light(0)
	update_icon()
	audible_message(SPAN_WARNING("Everything went quiet."))

/obj/structure/machinery/prop/almayer/computer/noisetv/bigger
	icon_state = "tvnoisebigger"

/obj/structure/machinery/prop/almayer/computer/noisetv/old
	name = "old TV"
	desc = "An old TV. You doubt that it still works."
	icon_state = "tvnoiseold"

/obj/structure/prop/cadaab_ore
	name = "allo"
	desc = "gde opisanie blyat?"
	icon = 'something/icons/shahti.dmi'
	icon_state = "use_THIS"//go figure
	var/icon_prefix = "stone"
	unslashable = TRUE
	opacity = FALSE
	density = TRUE

/obj/structure/prop/cadaab_ore/random
	name = "random ore"

/obj/structure/prop/cadaab_ore/random/stone
	name = "sandstone"
	desc = "A solidified collection of local minerals. When melted, becomes a substance best known as lava."
	icon_state = "stone0"
	icon_prefix = "stone"

/obj/structure/prop/cadaab_ore/random/stone_iron
	name = "iron-rich sandstone"
	desc = "A rough chunk of mineral-rich sandstone. Faint traces of oxidized iron give it a rusty hue."
	icon_state = "stoneiron0"
	icon_prefix = "stoneiron"

/obj/structure/prop/cadaab_ore/random/stone_gold
	name = "gold-flecked sandstone"
	desc = "A shimmering piece of sandstone laced with tiny golden flakes. It glints softly in the light."
	icon_state = "stonegold0"
	icon_prefix = "stonegold"

/obj/structure/prop/cadaab_ore/random/stone_silver
	name = "silver-veined sandstone"
	desc = "This sandstone holds delicate veins of silver running through its porous body. Surprisingly heavy for its size."
	icon_state = "stonesilver0"
	icon_prefix = "stonesilver"

/obj/structure/prop/cadaab_ore/random/stone_uran
	name = "uranium-bearing sandstone"
	desc = "A dense piece of sandstone emitting a faint green glow. Not something you'd want to carry in your pocket."
	icon_state = "stoneuran0"
	icon_prefix = "stoneuran"
	light_color = COLOR_DARK_MODERATE_LIME_GREEN
	light_range = 2

/obj/structure/prop/cadaab_ore/random/stone_phoron
	name = "phoron-infused sandstone"
	desc = "A volatile chunk of sandstone faintly humming with phoron energy. Warm to the touch and highly unstable."
	icon_state = "stonephoron0"
	icon_prefix = "stonephoron"
	light_color = COLOR_VERY_SOFT_YELLOW
	light_range = 2

/obj/structure/prop/cadaab_ore/random/Initialize(mapload, ...)
	. = ..()
	if(icon_prefix)
		icon_state = "[icon_prefix][rand(0,6)]"

/obj/structure/prop/cadaab
	name = "cadaab object"
	desc = "A random object found on Cadaab."
	icon = 'something/icons/objects.dmi'
	icon_state = "alive" //go figure
	unslashable = TRUE
	opacity = FALSE
	density = TRUE
	anchored = TRUE

/obj/structure/prop/cadaab/gravestone
	name = "gravestone"
	desc = "A gravestone with a faded inscription. It seems to have been here for a long time."
	icon_state = "gravestone"

/obj/structure/prop/cadaab/gravestone/two
	icon_state = "gravestone2"

/obj/structure/prop/cadaab/gravestone/three
	name = "gravestone with a cross"
	desc = "A crude makeshift grave. It has a cross on it, and the inscription is barely legible."
	icon_state = "grave"

/obj/structure/prop/cadaab/remains
	name = "remains"
	desc = "A pile of bones and tattered clothing."
	icon_state = "remains"
	density = FALSE

/obj/structure/prop/cadaab/remains/two
	icon_state = "remains2"

/obj/structure/prop/cadaab/remains/spikehead
	name = "spikehead"
	desc = "Someone's skull impaled on a sharp stick, poor guy."
	icon_state = "spikehead"

/obj/structure/closet/tent
	name = "tent"
	desc = "A pretty big green tent."
	icon = 'something/icons/tent.dmi'
	material = MATERIAL_WOOD
	anchored = FALSE
	health = 10

	icon_state = "tent"
	icon_closed = "tent"
	icon_opened = "tent_open"

	open_sound = 'sound/effects/rustle1.ogg'
	close_sound = 'sound/effects/rustle5.ogg'

/obj/structure/reagent_dispensers/fueltank/cadaab
	name = "gas station"
	desc = "There's probably still fuel left in it."
	icon = 'something/icons/objects.dmi'
	icon_state = "fuel"
	anchored = TRUE

/obj/structure/prop/cadaab/weeks
	name = "status display"
	desc = "It says, 'Decontamination in two weeks.'"
	icon_state = "2weeks"

/obj/structure/prop/cadaab/ads
	name = "IPCRUNNER 2320"
	desc = "They try to make you watch stupid movies even on the forgotten moon."
	icon = 'something/icons/objects.dmi'
	icon_state = "ipcrunner"
	anchored = TRUE
	density = TRUE
	health = 30

/obj/structure/prop/cadaab/ads/propaganda
	name = "Terran propaganda"
	icon_state = "tovarisch"
	desc = "'A TI ZAPISALSYA V DOBROVOLCI?'."

/obj/structure/prop/cadaab/ads/retro
	name = "CYBER KILLER RETRO advertising panel"
	icon_state = "retro"

/obj/structure/prop/cadaab/ads/proc/explode()
	visible_message(SPAN_DANGER("[src] breaks apart!"), max_distance = 1)
	deconstruct(FALSE)

/obj/structure/prop/cadaab/ads/proc/healthcheck()
	if(health <= 0)
		explode()

/obj/structure/prop/cadaab/ads/ex_act(severity)
	switch(severity)
		if(EXPLOSION_THRESHOLD_LOW to EXPLOSION_THRESHOLD_MEDIUM)
			if(prob(50))
				deconstruct(FALSE)
		if(EXPLOSION_THRESHOLD_MEDIUM to INFINITY)
			deconstruct(FALSE)

/obj/structure/ladder/holecadaab
	name = "hole with rope"
	desc = "A hole in the ground with a rope leading down. It looks like it was made by someone who wanted to get to the underground."
	icon = 'something/icons/turfs.dmi'
	icon_state = "ladder"

/obj/structure/ruins
	name = "ruins"
	desc = "A huge impenetrable pile of garbage, consisting of fragments of walls, cars, tanks and the rest."
	icon = 'something/icons/rubble.dmi'
	icon_state = "base"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	opacity = 1

/obj/structure/ruins/Initialize()
	. = ..()
	update_icon()

/obj/structure/ruins/update_icon()
	overlays.Cut()
	var/list/parts = list()
	for(var/i = 1 to 7)
		var/image/I = image(icon,"rubble[rand(1,15)]")
		if(prob(10))
			var/atom/A
			if(initial(A.icon) && initial(A.icon_state))
				I.icon = initial(A.icon)
				I.icon_state = initial(A.icon_state)
				I.color = initial(A.color)
		I.appearance_flags = PIXEL_SCALE
		I.pixel_x = rand(-16,16)
		I.pixel_y = rand(-16,16)
		parts += I
	overlays = parts

/obj/structure/fence/steelfence
	name = "steel fence"
	desc = "A flimsy lattice of metal rods, with screws to secure it to the floor."
	icon = 'something/icons/objects.dmi'
	icon_state = "steelfence"

/obj/structure/fence/steelfence/update_icon()
	return

/obj/structure/mineral_door/steelfence
	icon = 'something/icons/objects.dmi'
	icon_state = "metal"
	mineralType = "metal"
	hardness = 1

/obj/structure/mineral_door/steelfence/open()
	isSwitchingStates = TRUE
	playsound(loc, 'something/sounds/fence_door.ogg', 25, 1)
	flick("[mineralType]opening",src)
	addtimer(CALLBACK(src, PROC_REF(finish_open)), 1 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_NO_HASH_WAIT)

/obj/structure/mineral_door/steelfence/finish_open()
	if(!loc)
		return
	density = FALSE
	opacity = FALSE
	open = TRUE
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/mineral_door/steelfence/close()
	isSwitchingStates = TRUE
	playsound(loc, 'something/sounds/fence_door.ogg', 25, 1)
	flick("[mineralType]closing",src)
	addtimer(CALLBACK(src, PROC_REF(finish_close)), 1 SECONDS, TIMER_UNIQUE|TIMER_OVERRIDE|TIMER_NO_HASH_WAIT)

/obj/structure/mineral_door/steelfence/finish_close()
	if(!loc)
		return
	density = TRUE
	opacity = TRUE
	open = FALSE
	update_icon()
	isSwitchingStates = FALSE

/obj/structure/mineral_door/steelfence/Dismantle(devastated = 0)
	if(!devastated)
		for(var/i = 1, i <= oreAmount, i++)
			new/obj/item/stack/sheet/metal(get_turf(src))
	qdel(src)

//Mapping instance
/obj/structure/mineral_door/steelfence/open
	density = FALSE
	opacity = FALSE
	open = TRUE
	icon_state = "metalopen"

/obj/structure/flora/tree/cadaab
	name = "tree"
	icon = 'something/icons/objects_48x48.dmi'
	icon_state = "tree"
	pixel_x = 0

/obj/structure/flora/tree/cadaab/cacti
	name = "cactus"
	icon_state = "cacti"

/obj/item/toy/prize/booker
	name = "Boris Militarist action figure"
	desc = "A brand new limited Boris Booker action figure! Now in military uniform."
	icon = 'something/icons/toys.dmi'
	icon_state = "booker"

/obj/item/toy/prize/booker/attack_self(mob/user)
	..()

	if(cooldown < world.time - 8)
		to_chat(user, SPAN_NOTICE("You play with [src]."))
		playsound(user, 'something/sounds/boris_slacker.ogg', 15, 1)
		cooldown = world.time

/obj/item/toy/prize/booker/flag
	name = "Boris Loyalist action figure"
	desc = "A brand new limited Boris Booker action figure! Now in poncho with Lordanian flag."
	icon_state = "booker_flag"

/obj/item/toy/prize/booker/armor
	name = "Boris Hero action figure"
	desc = "A brand new limited Boris Booker action figure! Now in his legendary battle armor."
	icon_state = "booker_armor"

/obj/item/toy/prize/booker/armor/attack_self(mob/user)
	..()

	if(cooldown < world.time - 8)
		to_chat(user, SPAN_NOTICE("You play with [src]."))
		playsound(user, 'something/sounds/boris_balls.ogg', 15, 1)
		cooldown = world.time

/obj/item/toy/plush/sin
	icon = 'something/icons/toys.dmi'
	var/phrase = "who knows what it says"

/obj/item/toy/plush/sin/masyunya
	name = "Magenta Demon of Lust plushie"
	desc = "An odd pink plush doll of a cat. It's soft, but you feel nervous just looking at it."
	icon_state = "masyunya"
	phrase = "<span class='warning'>Obey my charms!</span>"

/obj/item/toy/plush/sin/masyunya/sima
	name = "Azure Devil of Terror plushie"
	desc = "An odd blue plush doll of a cat. It's soft, but you feel nervous just looking at it."
	icon_state = "sima"
	phrase = "<span class='warning'>Tell me, are you afraid of death?</span>"

/obj/item/toy/plush/sin/masyunya/necoarc
	name = "Amber Prince of Darkness plushie"
	desc = "An odd yellow plush doll of a cat. It's soft, but you feel nervous just looking at it."
	icon_state = "necoarc"
	phrase = "<span class='warning'>Reject humanity - make us whole.</span>"

/obj/item/toy/plush/sin/attack_self(mob/user)
	..()
	if(!COOLDOWN_FINISHED(src, last_hug_time))
		return
	user.visible_message(SPAN_NOTICE("[user] hugs [src] tightly!"), SPAN_NOTICE("You hug [src]."))
	if (phrase)
		audible_message(phrase, max_distance = 3)
	playsound(user, "plush", 25, TRUE)
	COOLDOWN_START(src, last_hug_time, 2.5 SECONDS)

/obj/item/gmoderror
	name = "error"
	desc = "error"
	icon = 'something/icons/error.dmi'
	icon_state = "error"

/obj/item/spacecash/cadaab_cash
	name = "cash"
	desc = "A wad of cash, probably left behind by some poor soul."
	icon = 'something/icons/money.dmi'
	icon_state = "spacecash1"

/obj/item/spacecash/cadaab_cash/c1
	name = "1 dollar bill"
	icon_state = "spacecash1"
	desc = "A single US Government minted one dollar bill. It has a picture of George Washington printed on it. Makes most people of English origin cry, but isn't worth very much. Could probably get you half a hot-dog in some systems. "
	worth = 1

/obj/item/spacecash/cadaab_cash/c10
	name = "10 dollar bill"
	icon_state = "spacecash10"
	desc = "A single US Government minted ten-dollar bill. It has a picture of Alexander Hamilton on it, federal bank enthusiast, and victim of a terrible griefing incident. Could probably pay for a meal at a cheap restaurant, before tax and tip."
	worth = 10

/obj/item/spacecash/cadaab_cash/c20
	name = "20 dollar bill"
	icon_state = "spacecash20"
	desc = "A single US Government minted twenty-dollar bill. It has a picture of Andrew Jackson on it, famed hero of the War of 1812 and slayer of indigenous peoples everywhere. Could probably afford you a nice 2-course meal at the local colony steakhouse."
	worth = 20

/obj/item/spacecash/cadaab_cash/c50
	name = "50 dollar bill"
	icon_state = "spacecash50"
	desc = "A single US Government minted fifty-dollar bill. It has a picture of Ulysses S. Grant, a man known for expendable troop tactics in the civil war, and probable distant relative of Bill Carson. You could probably buy the whole bar a beer with this, assuming there are 4 other people in the bar."
	worth = 50

/obj/item/spacecash/cadaab_cash/c100
	name = "100 dollar bill"
	icon_state = "spacecash100"
	desc = "A single US Government minted hundred-dollar bill. It has a picture of Ben Franklin, lightning kite extraordinaire. You could probably pay for an entire day of shore leave activities with this, provided you aren't careless. (which you are)"
	worth = 100

/obj/item/spacecash/cadaab_cash/c200
	name = "200 dollars"
	icon_state = "spacecash200"
	desc = "Two US Government minted hundred-dollar bills. They both have pictures of Ben Franklin on them. Both Bens look at you expectedly and passionately from different angles."
	worth = 200

/obj/item/spacecash/cadaab_cash/c500
	name = "500 dollars"
	icon_state = "spacecash500"
	desc = "Five US Government minted hundred-dollar bills. All of them have pictures of Ben Franklin on them. They all eagarly glare at you, making you feel as if you owe them something. "
	worth = 500

/obj/item/spacecash/cadaab_cash/c1000
	name = "1000 dollars"
	icon_state = "spacecash1000"
	desc = "Ten US Government minted hundred-dollar bills. Every single damn one of them has Ben Fucking Franklin on them. The court of Bens sit impatiently, as if each one thought they alone belonged to you. This coven of angry Bens have all since learned about your relations with the other Bens, and they want answers."
	worth = 1000

/obj/structure/prop/cadaab/bomba
	name = "le bomba"
	desc = "big boom"
	icon_state = "bomba"

/obj/structure/prop/cadaab/bomba/Destroy()
	var/turf/T = get_turf(src)
	if(T)
		explosion(T, 0, 3, 5, 7)
	. = ..()

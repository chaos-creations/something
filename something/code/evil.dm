//Look Sir, free crabs!
/mob/living/simple_animal/scorpion
	name = "scorpion"
	desc = "Predatory arachnid, most commonly living in deserts. Watch out for its stinger!"
	desc_lore = "This one bears striking resemblance to species found on Earth, and the explanation for this phenomena is obvious: one of the more well-endowed colonists (perhaps, WY-assigned supervisor) brought their pet scorpion which then escaped into the wild, giving birth to numerous offspring."
	icon_state = "scorpion"
	icon_living = "scorpion"
	icon_dead = "scorpion_dead"
	mob_size = MOB_SIZE_SMALL
	speak_emote = list("clicks")
	emote_hear = list("clicks")
	emote_see = list("clacks")
	speak_chance = 1
	turns_per_move = 5
	meat_type = /obj/item/reagent_container/food/snacks/meat
	response_help  = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm   = "stomps the"
	stop_automated_movement = 1
	friendly = "pinches"
	var/evil = TRUE

/mob/living/simple_animal/scorpion/attack_hand(mob/user)
	if(prob(25) && ishuman(user) && evil)
		var/mob/living/carbon/human/human = user
		visible_message(SPAN_WARNING("[src] stings [human]!"))
		human.reagents.add_reagent("stoxin", rand(4, 7))
		return
	..()

/mob/living/simple_animal/scorpion/wounded
	desc = "Predatory arachnid, mainly commonly in deserts. This one is missing its stinger, poor guy."
	icon_state = "scorpion_wounded"
	icon_living = "scorpion_wounded"
	icon_dead = "scorpion_wounded_dead"
	evil = FALSE

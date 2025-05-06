/obj/item/melee/energy/sword/uplink // energy sword. Downgraded for traitor use.
	desc = "May the force be within you. A telecrystal-safe energy sword with a downgraded power supply."
	armour_penetration = 20 // SPLURT EDIT ANTAG_NERF, ORIGINAL PENETRATION: 35
	block_chance = 5  // SPLURT EDIT ANTAG_NERF, ORIGINAL BLOCK_CHANCE: 50

/obj/item/melee/energy/sword/uplink/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(!HAS_TRAIT(src, TRAIT_TRANSFORM_ACTIVE))
		return FALSE

	if(attack_type == LEAP_ATTACK)
		final_block_chance -= 5 //OH GOD GET IT OFF ME

	return ..()

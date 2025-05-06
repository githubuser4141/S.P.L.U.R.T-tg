/*
 * Double-Bladed Energy Swords - Cheridan
 */
/obj/item/dualsaber/uplink // double-bladed energy sword. Downgraded for traitor use.
	desc = "Handle with care. A telecrystal-safe dual saber with a downgraded power supply."
	block_chance = 10 // SPLURT EDIT ANTAG_NERF, ORIGINAL BLOCK_CHANCE: 75

/obj/item/dualsaber/uplink/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	.=..()

	if(attack_type == PROJECTILE_ATTACK)
		var/obj/projectile/our_projectile = hitby

		if(our_projectile.reflectable)
			final_block_chance = 0 //we handle this via IsReflect(), effectively 75% block
		else
			final_block_chance -= 10 //We aren't AS good at blocking physical projectiles, like ballistics and thermals

	if(attack_type == LEAP_ATTACK)
		final_block_chance -= 5 //We are particularly bad at blocking someone JUMPING at us..

	return ..()

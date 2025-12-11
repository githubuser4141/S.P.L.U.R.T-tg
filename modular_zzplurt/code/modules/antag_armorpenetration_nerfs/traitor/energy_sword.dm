// Traitor's e-sword receives a modernate nerf

/obj/item/melee/energy/sword/saber/low_power
	name = "energy saber"
	desc = "A vintage model power sword that's commonly used by criminals, but is considered obsolete by modern standards."
	armour_penetration = 15
	block_chance = 25

/obj/item/melee/energy/sword/saber/low_power/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(!HAS_TRAIT(src, TRAIT_TRANSFORM_ACTIVE))
		return FALSE

	if(attack_type == LEAP_ATTACK)
		final_block_chance -= 15 //OH GOD GET IT OFF ME

	if(attack_type == MELEE_ATTACK)
		final_block_chance += 25

	if(attack_type == PROJECTILE_ATTACK || THROWN_PROJECTILE_ATTACK)
		final_block_chance -= 15

	return ..()

// Other variants receive a milder nerf

/obj/item/melee/energy/sword/cyborg
	armour_penetration = 20
	block_chance = 35

/obj/item/melee/energy/sword/pirate
	armour_penetration = 20
	block_chance = 35


/*
 * Double-Bladed Energy Swords - Cheridan
 */
/obj/item/dualsaber/low_power
	name = "double-bladed energy sword"
	desc = "Handle with care. This model is clad in a lightweight polymer, and doesn't feel as heavy."
	armour_penetration = 25
	block_chance = 35
	demolition_mod = 1.5 //1.5x damage to objects, robots, etc.

/obj/item/dualsaber/low_power/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return FALSE //not interested unless we're wielding

	if(attack_type == PROJECTILE_ATTACK)
		var/obj/projectile/our_projectile = hitby

		if(our_projectile.reflectable)
			final_block_chance = 0 //we handle this via IsReflect(), effectively 75% block
		else
			final_block_chance -= 15 //We aren't AS good at blocking physical projectiles, like ballistics and thermals

	if(attack_type == LEAP_ATTACK)
		final_block_chance -= 15 //We are particularly bad at blocking someone JUMPING at us..

	if(attack_type == OVERWHELMING_ATTACK)
		final_block_chance = 0 //Far too small to block these kinds of attacks.

	return ..()

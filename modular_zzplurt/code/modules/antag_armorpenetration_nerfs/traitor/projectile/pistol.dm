/obj/projectile/bullet/a57
	name = "5.7x28 bullet"
	damage = 16
	armour_penetration = 20

/obj/projectile/bullet/a57/ap
	name = "5.7x28 armor-piercing bullet"
	damage = 10
	armour_penetration = 50
	projectile_piercing = PASSMOB

/obj/projectile/bullet/a30sc
	name = ".30 Super Carry bullet"
	damage = 18
	armour_penetration = 10

/obj/projectile/bullet/a57/ap/on_hit(atom/target, blocked = 0, pierce_hit)
	if(isliving(target))
		var/mob/living/poor_sap = target
		var/poor_sap_armor = poor_sap.run_armor_check(def_zone, BULLET, "", "", TRUE)

		// If the target mob has enough armor to stop the bullet, or the bullet has already gone through one person, the bullet gets a bit more damage but no AP.
//		if((poor_sap.run_armor_check(def_zone, BULLET, "", "", silent = TRUE) > 40) || (pierces > 1))
		if(pierces > 1)
			projectile_piercing = NONE
			damage += 3
			armour_penetration = 0
			weak_against_armour = TRUE
		if(poor_sap_armor >= 40)
			projectile_piercing = NONE

	return ..()
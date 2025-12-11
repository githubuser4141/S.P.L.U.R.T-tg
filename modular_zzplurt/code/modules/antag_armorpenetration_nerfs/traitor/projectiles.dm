// 7.62x38mmR (Nagant Revolver)

/obj/projectile/bullet/n762
	name = "7.62x38mmR bullet"
	damage = 60

// .357 (Syndie Revolver)

/obj/projectile/bullet/c357
	name = ".357 bullet"
	damage = 40
	wound_bonus = -30

/obj/projectile/bullet/c357/phasic
	name = ".357 phasic bullet"
	icon_state = "gaussphase"
	damage = 20
	armour_penetration = 100
	projectile_phasing =  PASSTABLE | PASSGLASS | PASSGRILLE | PASSCLOSEDTURF | PASSMACHINE | PASSSTRUCTURE | PASSDOORS

/obj/projectile/bullet/c357/heartseeker
	name = ".357 heartseeker bullet"
	icon_state = "gauss"
	damage = 35
	homing_turn_speed = 120

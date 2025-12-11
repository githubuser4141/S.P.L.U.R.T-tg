/obj/item/gun/ballistic/revolver/low_power
	name = "\improper .357 revolver"
	desc = "A vintage revolver chamered in .357 Magnum, watch your fingers."
	projectile_damage_multiplier = 0.7 // 42 damage

/obj/item/gun/ballistic/automatic/pistol
	name = "\improper Makarov pistol"
	desc = "A small, easily concealable 9x25mm Mk.12 handgun. Has a threaded barrel for suppressors."	// SKYRAT EDIT: Calibre rename
	w_class = WEIGHT_CLASS_SMALL
	projectile_damage_multiplier = 0.8 // 24 damage

/obj/item/gun/ballistic/automatic/pistol/custom1911
	name = "customized 1911"
	desc = "A 1911 that's chambered in .30 Super Carry, developed by Scarborough Arms."
	accepted_magazine_type = /obj/item/ammo_box/magazine/m30sc

/obj/item/gun/ballistic/automatic/rifle/ar57
	name = "AR-57"
	desc = "A black polymer-clad rifle chambered in 5.7x28, it has a shortened barrel for portability."
	accepted_magazine_type = /obj/item/ammo_box/magazine/m57
	w_class = WEIGHT_CLASS_BULKY
	projectile_damage_multiplier = 1.2

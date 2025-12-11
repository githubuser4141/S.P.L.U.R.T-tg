//All bundles and telecrystals
/datum/uplink_category/firearms
	name = "Firearms"
	weight = 9

// Pistols

/datum/uplink_item/dangerous/pistol
	name = "Makarov Pistol Case"
	desc = "A weapon case containing an unknown variant of the Makarov pistol, along with two spare magazines and a box of loose 9mm ammunition. \
		Chambered in 9mm. Perfect for frequent skirmishes with security, as well as ensuring you have enough firepower to outlast the competition. \
		While not included in the kit, the pistol is compatible with suppressors, which can be purchased separately."
	item = /obj/item/storage/toolbox/guncase/traitor
	cost = 6
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS

/datum/uplink_item/dangerous/revolver
	name = "Syndicate Revolver"
	desc = "A brutally simple Syndicate revolver that fires .357 Magnum rounds and has 7 chambers."
	item = /obj/item/gun/ballistic/revolver/low_power
	cost = 8
	surplus = 50
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS //only traitors get the original revolver

/datum/uplink_item/firearms/liberator
	name = "Liberator"
	desc = "A single-shot, makeshift firearm. Almost useless for any operation, but could be used as a distraction."
	item = /obj/item/gun/ballistic/automatic/pistol/doorhickey
	cost = 1
	surplus = 10

/datum/uplink_item/firearms/supercarry
	name = "customized 1911"
	desc = "A full-size 1911 customized by Scarborough Arms to be chambered in .30 Super Carry, it holds 12 round magazines and comes with a unique wood grip."
	item = /obj/item/gun/ballistic/automatic/pistol/custom1911
	cost = 5
	surplus = 10

// Shotguns

/datum/uplink_item/firearms/doublebarrel
	name = "Double-barrel shotgun"
	desc = "A double-barrel shotgun, can be loaded with any 12 gauge shotgun ammo. Omar's coming."
	item = /obj/item/gun/ballistic/shotgun/doublebarrel
	cost = 4
	surplus = 10

/datum/uplink_item/firearms/shotgun
	name = "Pump-action shotgun"
	desc = "A classic four-shell, plus one in the tube, shotgun, a practical weapon for many situations. "
	item = /obj/item/gun/ballistic/shotgun
	cost = 5
	surplus = 10

// SMGs

/obj/item/gun/ballistic/automatic/mini_uzi

/datum/uplink_item/firearms/uzi
	name = "Mini Uzi"
	desc = "A Uzi submachinegun chambered in 9mm, for when you really want someone dead."
	item = /obj/item/gun/ballistic/automatic/mini_uzi
	cost = 10
	surplus = 10
	progression_minimum = 30 MINUTES

/datum/uplink_item/firearms/tommy
	name = "Thompson SMG"
	desc = "A heavy SMG chambered in .45 ACP. Fully automatic."
	item = /obj/item/gun/ballistic/automatic/tommygun
	cost = 15
	surplus = 10
	progression_minimum = 45 MINUTES
	population_minimum = TRAITOR_POPULATION_LOWPOP

/datum/uplink_item/firearms/ar57
	name = "AR-57"
	desc = "A AR-15 style rifle chambered in 5.7, with a shortened 12 inch barrel, great for CQB situations."
	item = /obj/item/gun/ballistic/automatic/tommygun
	cost = 7
	surplus = 10
	progression_minimum = 45 MINUTES
	population_minimum = TRAITOR_POPULATION_LOWPOP

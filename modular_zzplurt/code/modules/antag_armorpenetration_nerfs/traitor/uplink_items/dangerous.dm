//All bundles and telecrystals
/datum/uplink_category/dangerous
	name = "Conspicuous Weapons"
	weight = 9

/datum/uplink_item/dangerous/sword
	name = "Energy Sword"
	desc = "The energy sword is an edged weapon with a blade of pure energy. The sword is small enough to be \
			pocketed when inactive. Activating it produces a loud, distinctive noise."
	item = /obj/item/melee/energy/sword/saber/low_power
	cost = 5
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/doublesword
	name = "Double-Bladed Energy Sword"
	desc = "The double-bladed energy sword does slightly more damage than a standard energy sword and will deflect \
			energy projectiles it blocks, but requires two hands to wield. It also struggles to protect you from tackles."
	progression_minimum = 30 MINUTES
	population_minimum = TRAITOR_POPULATION_LOWPOP
	item = /obj/item/dualsaber/low_power

	cost = 10
	purchasable_from = ~UPLINK_ALL_SYNDIE_OPS //nukies get their own version

/datum/uplink_item/dangerous/doublesword/get_discount_value(discount_type)
	switch(discount_type)
		if(TRAITOR_DISCOUNT_BIG)
			return 0.5
		if(TRAITOR_DISCOUNT_AVERAGE)
			return 0.35
		else
			return 0.2


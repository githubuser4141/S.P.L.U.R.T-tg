/datum/uplink_item/dangerous/sword
	name = "Degraded Energy Sword"
	desc = "A older model of the infamous energy sword, this variant has a downgraded power supply, and is popular amongst criminals and poorly funded mercenaries."
	item = /obj/item/melee/energy/sword/saber/uplink
	cost = 5
	purchasable_from = ~UPLINK_CLOWN_OPS

/datum/uplink_item/dangerous/doublesword // Double-Bladed Energy Sword
	name = "Degraded Dual-Sabre"
	desc = "This obsolete dual-sabre does more damage than the ordinary energy sword, and has a slight chance to stop ranged threats, at the cost of bulk, requiring two hands to wield."
	progression_minimum = 30 MINUTES
	population_minimum = TRAITOR_POPULATION_LOWPOP
	item = /obj/item/dualsaber/uplink
	cost = 10

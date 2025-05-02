/obj/item/mecha_parts/mecha_equipment/armor
	///how much integrity this armor have
	var/armor_integrity = 100
	var/added_armor = 0
	var/damage_reduction = 10
	var/mechslowdown = 0
	var/armor_operational = TRUE

/obj/item/mecha_parts/mecha_equipment/armor/roundstart
	armor_integrity = 100
	name = "General Purpose Metal Plates"
	desc = "Special armoured ablative plate of metal, designed to increase survivability. Standard issue for military-grade exosuits"
	icon_state = "roundstartarmor"
	iconstate_name = "melee"
	protect_name = "General Armor"
	mechslowdown = 0.5
	armor_mod = /datum/armor/mecha_equipment_roundstart_armor

/datum/armor/mecha_equipment_roundstart_armor
	melee = 15
	bullet = 5
	laser = 10

/obj/item/mecha_parts/mecha_equipment/armor/attach(obj/vehicle/sealed/mecha/new_mecha, attach_right)
	. = ..()
	armor_integrity += (added_armor = min(new_mecha.max_integrity/2, 100))
	chassis.set_armor(chassis.get_armor().add_other_armor(armor_mod))

/obj/item/mecha_parts/mecha_equipment/armor/detach(atom/moveto)
	armor_integrity -= (added_armor = min(chassis.max_integrity/2, 100))
	chassis.set_armor(chassis.get_armor().subtract_other_armor(armor_mod))
	return ..()

// *** Light Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/plasteel_armor_plating
	name = "Plasteel Armor Plating"
	desc = "A lightweight set of plasteel plates designed to effectively armor exosuits with a lightweight package."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Plasteel Plating"
	armor_mod = /datum/armor/mecha_equipment_plasteel_armor
	armor_integrity = 125
	mechslowdown = 0.5
	damage_reduction = 10

/datum/armor/mecha_equipment_plasteel_armor
	melee = 25
	bullet = 20
	laser = 10

/obj/item/mecha_parts/mecha_equipment/armor/flexible_armor_plating
	name = "Flexible Armor Plating"
	desc = "A set of flexible, lightweight plates that surround the exosuit's exterior, offering decent protection for light use."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Flexible Plating"
	armor_mod = /datum/armor/mecha_equipment_flexible_armor
	armor_integrity = 150
	mechslowdown = 0
	damage_reduction = 5

/datum/armor/mecha_equipment_flexible_armor
	melee = 10
	bullet = 15
	laser = 15

// *** Medium Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/steel_armor_plating
	name = "Steel Armor Plating"
	desc = "A inexpensive, though cumbersome, option to armor exosuits, has decent durability and protective value."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Steel Plating"
	armor_mod = /datum/armor/mecha_equipment_steel_armor
	armor_integrity = 200
	mechslowdown = 1.5
	damage_reduction = 10

/datum/armor/mecha_equipment_steel_armor
	melee = 35
	bullet = 15
	laser = 20

/obj/item/mecha_parts/mecha_equipment/armor/composite_armor_plating
	name = "Composite Armor Plating"
	desc = "A specialist armor package designed to excel at shielding the exosuit from damage, the ceramic layers somewhat lack long term durability."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Composite Plating"
	armor_mod = /datum/armor/mecha_equipment_composite_armor
	armor_integrity = 75
	mechslowdown = 1
	damage_reduction = 20

/datum/armor/mecha_equipment_composite_armor
	melee = 40
	bullet = 45
	laser = 45

// *** Heavy Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/heavy_armor_plating
	name = "Heavy Armor Plating"
	desc = "A set of very thick, hardened metals and ceramic plating. Very expensive to manufacture and is often impractically heavy, but offers substantial protection."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Heavy Plating"
	armor_mod = /datum/armor/mecha_equipment_heavy_armor
	armor_integrity = 200
	mechslowdown = 2
	damage_reduction = 25

/datum/armor/mecha_equipment_heavy_armor
	melee = 40
	bullet = 50
	laser = 50

/obj/item/mecha_parts/mecha_equipment/armor/heavy_armor_plating/specialist
	name = "Heavy Armor Plating"
	desc = "A set of armor, using cutting-edge metals and composite materials. Rarely found among civilian exosuits."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Ranged Armor"
	armor_mod = /datum/armor/mecha_equipment_heavy_armor_specialist
	armor_integrity = 300
	mechslowdown = 1
	damage_reduction = 30

/datum/armor/mecha_equipment_heavy_armor_specialist
	melee = 50
	bullet = 50
	laser = 50

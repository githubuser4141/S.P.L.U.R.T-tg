/obj/item/mecha_parts/mecha_equipment/armor
	///how much integrity this armor have
	var/armor_integrity
	var/max_armor_integrity = 100
	var/added_armor = 0
	var/damage_reduction = 10
	var/move_slowdown = 0
	var/armor_operational = TRUE

/obj/item/mecha_parts/mecha_equipment/armor/roundstart
	armor_integrity = 100
	name = "General Purpose Metal Plates"
	desc = "Special armoured ablative plate of metal, designed to increase survivability. Standard issue for military-grade exosuits"
	icon_state = "roundstartarmor"
	iconstate_name = "melee"
	protect_name = "General Armor"
	move_slowdown = 0.5
	armor_mod = /datum/armor/mecha_equipment_roundstart_armor

/datum/armor/mecha_equipment_roundstart_armor
	melee = 15
	bullet = 5
	laser = 10

/obj/item/mecha_parts/mecha_equipment/armor/Initialize(mapload)
	. = ..()
	armor_integrity = max_armor_integrity

/obj/item/mecha_parts/mecha_equipment/armor/attach(obj/vehicle/sealed/mecha/new_mecha, attach_right)
	. = ..()
	chassis.update_move_speed()
	max_armor_integrity += (added_armor = min(new_mecha.max_integrity/2, 100))
	armor_integrity += (added_armor = min(new_mecha.max_integrity/2, 100))

/obj/item/mecha_parts/mecha_equipment/armor/detach(atom/moveto)
	. = ..()
	chassis.update_move_speed()
	max_armor_integrity -= (added_armor = min(chassis.max_integrity/2, 100))
	armor_integrity -= (added_armor = min(chassis.max_integrity/2, 100))

/*
/obj/item/mecha_parts/mecha_equipment/armor/attach(obj/vehicle/sealed/mecha/new_mecha, attach_right)
	. = ..()
	max_armor_integrity += (added_armor = min(new_mecha.max_integrity/2, 100))
	armor_integrity += (added_armor = min(new_mecha.max_integrity/2, 100))

/obj/item/mecha_parts/mecha_equipment/armor/detach(atom/moveto)
	max_armor_integrity -= (added_armor = min(chassis.max_integrity/2, 100))
	armor_integrity -= (added_armor = min(chassis.max_integrity/2, 100))
	return ..()
*/
#define MECHA_SNOWFLAKE_ID_ARMOR "armor_snowflake"

/obj/item/mecha_parts/mecha_equipment/armor/get_snowflake_data()
	return list(
		"snowflake_id" = MECHA_SNOWFLAKE_ID_ARMOR,
		"armor_integrity" = armor_integrity,
		"max_armor_integrity" = max_armor_integrity,
	)

// *** Light Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/flexible_armor_plating
	name = "Flexible Armor Plating"
	desc = "A flexible armor composed of ultralight plasma-fibres covering most of the exosuit's chassis, ideal for low-intensity situations where mobility is key."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Flexible Plating"
	armor_mod = /datum/armor/mecha_equipment_flexible_armor
	max_armor_integrity = 150
	move_slowdown = 0
	damage_reduction = 5

/datum/armor/mecha_equipment_flexible_armor
	melee = 10
	bullet = 15
	laser = 10

/obj/item/mecha_parts/mecha_equipment/armor/plasteel_armor_plating
	name = "Plasteel Armor Plating"
	desc = "A set of reinforced plasma-fibre bundles pressed into rigid plates, for good protection while remaining lightweight."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Plasteel Plating"
	armor_mod = /datum/armor/mecha_equipment_plasteel_armor
	max_armor_integrity = 125
	move_slowdown = 0.5
	damage_reduction = 10

/datum/armor/mecha_equipment_plasteel_armor
	melee = 25
	bullet = 20
	laser = 10

// *** Medium Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/steel_armor_plating
	name = "Steel Armor Plating"
	desc = "A inexpensive, though cumbersome, option to armor exosuits, has decent durability and protective value."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Steel Plating"
	armor_mod = /datum/armor/mecha_equipment_steel_armor
	max_armor_integrity = 200
	move_slowdown = 1.5
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
	max_armor_integrity = 75
	move_slowdown = 1
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
	max_armor_integrity = 200
	move_slowdown = 2
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
	max_armor_integrity = 300
	move_slowdown = 1
	damage_reduction = 30

/datum/armor/mecha_equipment_heavy_armor_specialist
	melee = 50
	bullet = 50
	laser = 50

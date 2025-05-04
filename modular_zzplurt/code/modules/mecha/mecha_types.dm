/// *** Mecha Health/Armor Nerfs/Changes go in here! *** ///
//integrity nerf to offset the armor buff
/obj/vehicle/sealed/mecha
	max_integrity = 200
	internal_damage_probability = 30

/obj/vehicle/sealed/mecha/durand
	max_integrity = 300

/datum/armor/mecha_durand
	melee = 20
	bullet = 15
	laser = 20
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/gygax
	max_integrity = 150

/datum/armor/mecha_gygax
	melee = 10
	bullet = 5
	laser = 15
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/gygax/dark
	max_integrity = 200

/datum/armor/mecha_gygax_dark
	melee = 20
	bullet = 15
	laser = 20
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/phazon
	max_integrity = 100

/datum/armor/mecha_phazon
	melee = 15
	bullet = 15
	laser = 15
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/savannah_ivanov
	max_integrity = 200

/datum/armor/mecha_savannah_ivanov
	melee = 25
	bullet = 20
	laser = 25
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/honker
	max_integrity = 100

/obj/vehicle/sealed/mecha/honker/dark
	max_integrity = 150

	max_equip_by_category = list(
		MECHA_L_ARM = 1,
		MECHA_R_ARM = 1,
		MECHA_UTILITY = 3,
		MECHA_POWER = 1,
		MECHA_ARMOR = 1,
	)

/datum/armor/mecha_honker_dark
	melee = 20
	bullet = 15
	laser = 20
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/justice
	max_integrity = 150

/datum/armor/mecha_justice
	melee = 20
	bullet = 15
	laser = 20
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/clarke
	max_integrity = 150

/datum/armor/mecha_clarke
	melee = 10
	bullet = 5
	laser = 10
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/ripley
	max_integrity = 150

/datum/armor/mecha_ripley
	melee = 10
	bullet = 5
	laser = 5
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/ripley/mk2
	max_integrity = 200

/datum/armor/mecha_ripley_mk2
	melee = 15
	bullet = 10
	laser = 15
	energy = 10
	bomb = 20
	fire = 100
	acid = 100

/obj/vehicle/sealed/mecha/odysseus
	max_integrity = 200
	armor_type = /datum/armor/mecha_odysseus

/datum/armor/mecha_odysseus
	melee = 5
	bullet = 0
	laser = 5
	energy = 10
	bomb = 20
	fire = 100
	acid = 100


//servos buff
/obj/vehicle/sealed/mecha/update_part_values()
	. = ..()
	update_move_speed()

/obj/vehicle/sealed/mecha/proc/update_move_speed()
	if(servo)
		var/percentage_buff = (100 - (servo.rating * 4)) / 100
		movedelay = initial(movedelay) * percentage_buff
	if(!equip_by_category[MECHA_ARMOR])
		return
	for(var/obj/item/mecha_parts/mecha_equipment/armor/mech_armor)
		if(!mech_armor.armor_operational)
			continue
		movedelay += mech_armor.move_slowdown

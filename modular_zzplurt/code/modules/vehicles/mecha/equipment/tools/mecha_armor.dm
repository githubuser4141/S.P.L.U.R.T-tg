#define MECHA_SNOWFLAKE_ID_ARMOR "armor_snowflake"

/obj/item/mecha_parts/mecha_equipment/armor
	applied_slowdown = 1.175
	/// Max health points inside the mecha, when null it will apply damage reduction regardless
	var/max_flat_mecha_hp
	/// Current health points inside a mecha for purposes of flat damage reduction, when it reaches 0, no more damage reduction
	var/flat_mecha_hp
	/// Basically flat damage reduction that gets applied after the mech's normal armor datum does it's thing
	var/datum/armor/flat_armor

/datum/armor/flat_mecha_armor
	acid = 0
	bio = 0
	bomb = 0
	bullet = 0
	consume = 0
	energy = 0
	laser = 0
	fire = 0
	melee = 0
	wound = 0

/obj/item/mecha_parts/mecha_equipment/armor/Initialize(mapload)
	. = ..()
	if(flat_armor)
		flat_armor = get_armor_by_type(flat_armor)
	flat_mecha_hp = max_flat_mecha_hp

/obj/item/mecha_parts/mecha_equipment/armor/Destroy()
	. = ..()
	flat_armor = null

/obj/item/mecha_parts/mecha_equipment/armor/examine(mob/user)
	. = ..()
	. += span_notice("[EXAMINE_HINT("Examine more")] to inspect armor values applied to mechs...")
	if(flat_armor)
		if(!isnull(max_flat_mecha_hp))
			switch(flat_mecha_hp / max_flat_mecha_hp)
				if(1 to INFINITY)
					. += span_notice("[p_Theyre()] in perfect condition.")
				if(0.75 to 1)
					. += span_notice("[p_Theyre()] in good condition.")
				if(0.5 to 0.75)
					. += span_warning("[p_Theyre()] in average condition.")
				if(0.25 to 0.5)
					. += span_warning("[p_Theyre()] in bad condition.")
				if(0 to 0.25)
					. += span_danger("[p_Theyre()] falling apart!")
				if(-INFINITY to 0)
					. += span_danger("[p_Theyre()] fractured and will no longer protect mechs!")

/obj/item/mecha_parts/mecha_equipment/armor/examine_more(mob/user)
	. = ..()
	var/list/readout = list()

	var/added_damage_header = FALSE
	if(armor_mod)
		var/datum/armor/armor_mod = get_armor_by_type(src.armor_mod)
		added_damage_header = FALSE
		for(var/damage_key in ARMOR_LIST_DAMAGE())
			var/rating = armor_mod.get_rating(damage_key)
			if(!rating)
				continue
			if(!added_damage_header)
				readout += "<b><u>MULTIPLICATIVE ARMOR (I-X)</u></b>"
				added_damage_header = TRUE
			readout += "[armor_to_protection_name(damage_key)] [armor_to_protection_class(rating)]"
	if(flat_armor)
		added_damage_header = FALSE
		for(var/damage_key in ARMOR_LIST_DAMAGE())
			var/rating = flat_armor.get_rating(damage_key)
			if(!rating)
				continue
			if(!added_damage_header)
				readout += "<b><u>FLAT ARMOR (I-X)</u></b>"
				added_damage_header = TRUE
			readout += "[armor_to_protection_name(damage_key)] [armor_to_protection_class(rating)]"

	var/added_durability_header = FALSE
	if(armor_mod)
		var/datum/armor/armor_mod = get_armor_by_type(src.armor_mod)
		added_durability_header = FALSE
		for(var/durability_key in ARMOR_LIST_DURABILITY())
			var/rating = armor_mod.get_rating(durability_key)
			if(!rating)
				continue
			if(!added_durability_header)
				readout += "<b><u>MULTIPLICATIVE DURABILITY (I-X)</u></b>"
				added_durability_header = TRUE
			readout += "[armor_to_protection_name(durability_key)] [armor_to_protection_class(rating)]"
	if(flat_armor)
		added_durability_header = FALSE
		for(var/durability_key in ARMOR_LIST_DURABILITY())
			var/rating = flat_armor.get_rating(durability_key)
			if(!rating)
				continue
			if(!added_durability_header)
				readout += "<b><u>FLAT DURABILITY (I-X)</u></b>"
				added_durability_header = TRUE
			readout += "[armor_to_protection_name(durability_key)] [armor_to_protection_class(rating)]"

	if(!length(readout))
		readout += "No armor or durability information available."

	var/formatted_readout = span_notice("<b>PROTECTION CLASSES</b><hr>[jointext(readout, "\n")]")
	. += boxed_message(formatted_readout)

/obj/item/mecha_parts/mecha_equipment/armor/get_snowflake_data()
	return list(
		"snowflake_id" = MECHA_SNOWFLAKE_ID_ARMOR,
		"flat_armor_integrity" = flat_mecha_hp,
		"flat_armor_integrity_max" = max_flat_mecha_hp,
	)

/obj/item/mecha_parts/mecha_equipment/armor/basic
	name = "Basic mech armor"
	desc = "Sacrificial plate of metal, designed to increase survivability. Standard issue for civillian grade exosuits."
	icon = 'modular_zzplurt/icons/obj/devices/mecha_equipment.dmi'
	icon_state = "mech_armor_basic"
	iconstate_name = "melee"
	protect_name = "Basic Armor"

	max_flat_mecha_hp = 100
	flat_mecha_hp = 100
	flat_armor = /datum/armor/flat_mecha_armor/basic
	armor_mod = /datum/armor/flexible

/datum/armor/basic
	melee = 15
	bullet = 10
	laser = 10

/datum/armor/flat_mecha_armor/basic
	bomb = 10
	bullet = 5
	laser = 5
	melee = 5

// *** Light Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/flexible
	name = "Flexible Armor Plating"
	desc = "A flexible armor composed of ultralight plasma-fibres covering most of the exosuit's chassis, ideal for low-intensity situations where mobility is key."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Flexible Plating"

	applied_slowdown = 1
	max_flat_mecha_hp = 150
	flat_mecha_hp = 150
	armor_mod = /datum/armor/flexible
	flat_armor = /datum/armor/flat_mecha_armor/flexible

/datum/armor/flexible
	melee = 10
	bullet = 15
	laser = 10

/datum/armor/flat_mecha_armor/flexible
	bullet = 5
	laser = 5
	melee = 5

/obj/item/mecha_parts/mecha_equipment/armor/plasfibre_shell
	name = "Plasteel Armor Plating"
	desc = "A set of reinforced plasma-fibre bundles pressed into rigid plates, for good protection while remaining lightweight."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Plasteel Plating"
	armor_mod = /datum/armor/plasfibre_shell

	applied_slowdown = 1.175
	max_flat_mecha_hp = 125
	flat_mecha_hp = 125
	armor_mod = /datum/armor/plasfibre_shell
	flat_armor = /datum/armor/flat_mecha_armor/plasfibre_shell

/datum/armor/plasfibre_shell
	melee = 25
	bullet = 20
	laser = 10

/datum/armor/flat_mecha_armor/plasfibre_shell
	bullet = 5
	laser = 5
	melee = 10

// *** Medium Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/steel
	name = "Steel Armor Plating"
	desc = "A inexpensive, though cumbersome, option to armor exosuits, has decent durability and protective value."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Steel Plating"
	armor_mod = /datum/armor/steel

	applied_slowdown = 1.425
	max_flat_mecha_hp = 300
	flat_mecha_hp = 300
	armor_mod = /datum/armor/steel
	flat_armor = /datum/armor/flat_mecha_armor/steel

/datum/armor/steel
	melee = 35
	bullet = 10
	laser = 15

/datum/armor/flat_mecha_armor/steel
	bullet = 10
	laser = 5
	melee = 15

/obj/item/mecha_parts/mecha_equipment/armor/composite
	name = "Composite Armor Plating"
	desc = "A specialist armor package designed to excel at shielding the exosuit from damage, the ceramic layers somewhat lack long term durability."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Composite Plating"
	armor_mod = /datum/armor/composite

	applied_slowdown = 1.225
	max_flat_mecha_hp = 75
	flat_mecha_hp = 75
	armor_mod = /datum/armor/composite
	flat_armor = /datum/armor/flat_mecha_armor/composite

/datum/armor/composite
	melee = 45
	bullet = 45
	laser = 45

/datum/armor/flat_mecha_armor/composite
	bullet = 20
	laser = 20
	melee = 20

// *** Heavy Armor *** //

/obj/item/mecha_parts/mecha_equipment/armor/heavy
	name = "Heavy Armor Plating"
	desc = "A set of very thick, hardened metals and ceramic plating. Very expensive to manufacture and is often impractically heavy, but offers substantial protection."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Heavy Plating"
	armor_mod = /datum/armor/heavy

	applied_slowdown = 1.3
	max_flat_mecha_hp = 200
	flat_mecha_hp = 200
	armor_mod = /datum/armor/heavy
	flat_armor = /datum/armor/flat_mecha_armor/heavy

/datum/armor/heavy
	melee = 50
	bullet = 45
	laser = 50

/datum/armor/flat_mecha_armor/heavy
	bullet = 20
	laser = 25
	melee = 25

/obj/item/mecha_parts/mecha_equipment/armor/heavy/specialist
	name = "Heavy Armor Plating"
	desc = "A set of armor, using cutting-edge metals and composite materials. Rarely found among civilian exosuits."
	icon_state = "mecha_abooster_proj"
	iconstate_name = "range"
	protect_name = "Ranged Armor"
	armor_mod = /datum/armor/heavy/specialist

	applied_slowdown = 1.175
	max_flat_mecha_hp = 300
	flat_mecha_hp = 300
	armor_mod = /datum/armor/heavy/specialist
	flat_armor = /datum/armor/flat_mecha_armor/heavy/specialist

/datum/armor/heavy/specialist
	melee = 50
	bullet = 50
	laser = 50

/datum/armor/flat_mecha_armor/heavy/specialist
	bullet = 25
	laser = 25
	melee = 25

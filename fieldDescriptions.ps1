﻿function setFieldDescriptions {


    $fieldDescriptions = [PSCustomObject]@{
        description                                      = "Ship description"
        has_demo_profile                                 = "Indicates that ship characteristics are used for illustration, and may be changed."
        is_premium                                       = "Indicates if the ship is Premium ship"
        is_special                                       = "Indicates if the ship is on a special offer"
        mod_slots                                        = "Number of slots for upgrades"
        name                                             = "Ship name"
        nation                                           = "Nation"
        next_ships                                       = "List of ships available for research in form of pairs"
        price_credit                                     = "Cost in credits"
        price_gold                                       = "Cost in gold"
        ship_id                                          = "Ship ID"
        ship_id_str                                      = "Ship string ID"
        tier                                             = "Tier"
        type                                             = "Type of ship"
        upgrades                                         = "List of compatible Modifications"
        default_profile                                  = "Parameters of basic configuration"
        default_profile_battle_level_range_max           = "Maximum battle tier for a random battle"
        default_profile_battle_level_range_min           = "Minimum battle tier for a random battle"
        default_profile_anti_aircraft                    = "Anti-aircraft guns. If the module is absent on the ship, field value is null."
        default_profile_anti_aircraft_defense            = "Anti-aircraft effectiveness"
        default_profile_anti_aircraft_slots              = "Gun slots"
        default_profile_anti_aircraft_slots_avg_damage   = "Average damage per second"
        default_profile_anti_aircraft_slots_caliber      = "Caliber"
        default_profile_anti_aircraft_slots_distance     = "Firing range (km)"
        default_profile_anti_aircraft_slots_guns         = "Number of guns"
        default_profile_anti_aircraft_slots_name         = "Gun name"
        default_profile_armour                           = "Survivability of basic configuration"
        default_profile_armour_flood_damage              = "Torpedo Protection. Damage Reduction (%)"
        default_profile_armour_flood_prob                = "Torpedo Protection. Flooding Risk Reduction (%)"
        default_profile_armour_health                    = "Hit points"
        default_profile_armour_total                     = "Armor protection (%)"
        default_profile_armour_casemate                  = "Gun Casemate"
        default_profile_armour_casemate_max              = "Maximum value"
        default_profile_armour_casemate_min              = "Minimum value"
        default_profile_armour_citadel                   = "Citadel"
        default_profile_armour_citadel_max               = "Maximum value"
        default_profile_armour_citadel_min               = "Minimum value"
        default_profile_armour_deck                      = "Armored Deck"
        default_profile_armour_deck_max                  = "Maximum value"
        default_profile_armour_deck_min                  = "Minimum value"
        default_profile_armour_extremities               = "Forward and After Ends"
        default_profile_armour_extremities_max           = "Maximum value"
        default_profile_armour_extremities_min           = "Minimum value"
        default_profile_armour_range                     = "Armor"
        default_profile_armour_range_max                 = "Maximum value"
        default_profile_armour_range_min                 = "Minimum value"
        default_profile_artillery                        = "Main battery. If the module is absent on the ship, field value is null."
        default_profile_artillery_artillery_id           = "Gun ID"
        default_profile_artillery_artillery_id_str       = "Gun string ID"
        default_profile_artillery_distance               = "Firing range"
        default_profile_artillery_gun_rate               = "Rate of fire (rounds / min)"
        default_profile_artillery_max_dispersion         = "Maximum dispersion (m)"
        default_profile_artillery_rotation_time          = "180 Degree Turn Time (sec)"
        default_profile_artillery_shot_delay             = "Main battery reload time (s)"
        default_profile_artillery_shells                 = "Shells"
        default_profile_artillery_shells_bullet_mass     = "Shell weight"
        default_profile_artillery_shells_bullet_speed    = "Shell speed"
        default_profile_artillery_shells_burn_probability= "Chance of Fire on target caused by shell (%)"
        default_profile_artillery_shells_damage          = "Maximum Damage"
        default_profile_artillery_shells_name            = "Shell name"
        default_profile_artillery_shells_type            = "Shell type"
        default_profile_artillery_slots                  = "Main gun slots"
        default_profile_artillery_slots_barrels          = "Number of barrels per slot"
        default_profile_artillery_slots_guns             = "Number of main turrets"
        default_profile_artillery_slots_name             = "Name"
        default_profile_atbas                            = "Secondary armament. If the module is absent on the ship, field value is null."
        default_profile_atbas_distance                   = "Firing range"
        default_profile_atbas_slots                      = "Main gun slots"
        default_profile_atbas_slots_bullet_mass          = "Shell weight"
        default_profile_atbas_slots_bullet_speed         = "Shell speed"
        default_profile_atbas_slots_burn_probability     = "Chance of Fire on target caused by shell (%)"
        default_profile_atbas_slots_damage               = "Maximum Damage"
        default_profile_atbas_slots_gun_rate             = "Rate of fire (rounds / min)"
        default_profile_atbas_slots_name                 = "Shell name"
        default_profile_atbas_slots_shot_delay           = "Reload time (s)"
        default_profile_atbas_slots_type                 = "Shell type"
        default_profile_concealment                      = "Concealment of basic configuration"
        default_profile_concealment_detect_distance_by_plane = "Air Detectability Range"
        default_profile_concealment_detect_distance_by_ship  = "Surface Detectability Range"
        default_profile_concealment_detect_distance_by_submarine = "Detectability range by depths"
        default_profile_concealment_total                = "Concealment (%)"
        default_profile_depth_charge                     = "Depth charges"
        default_profile_depth_charge_bomb_max_damage     = "Maximum damage"
        default_profile_depth_charge_max_packs           = "Number of charges"
        default_profile_depth_charge_num_bombs_in_pack   = "Bombs in charge"
        default_profile_depth_charge_reload_time         = "Reload time"
        default_profile_dive_bomber                      = "Dive bombers. If the module is absent on the ship, field value is null."
        default_profile_dive_bomber_bomb_bullet_mass     = "Bomb weight"
        default_profile_dive_bomber_bomb_burn_probability= "Chance of Fire on target caused by bomb (%)"
        default_profile_dive_bomber_bomb_damage          = "Maximum bomb damage"
        default_profile_dive_bomber_bomb_name            = "Bomb name"
        default_profile_dive_bomber_cruise_speed         = "Cruise Speed (knots)"
        default_profile_dive_bomber_dive_bomber_id       = "Dive bombers' ID"
        default_profile_dive_bomber_dive_bomber_id_str   = "Dive bombers string ID"
        default_profile_dive_bomber_gunner_damage        = "Average damage per rear gunner of a dive bomber per second"
        default_profile_dive_bomber_max_damage           = "Maximum Bomb Damage"
        default_profile_dive_bomber_max_health           = "Survivability"
        default_profile_dive_bomber_name                 = "Name of squadron"
        default_profile_dive_bomber_plane_level          = "Dive bomber tier"
        default_profile_dive_bomber_prepare_time         = "Time of preparation for takeoff (sec)"
        default_profile_dive_bomber_squadrons            = "Number of squadrons"
        default_profile_dive_bomber_accuracy             = "Accuracy"
        default_profile_dive_bomber_accuracy_max         = "Maximum value"
        default_profile_dive_bomber_accuracy_min         = "Minimum value"
        default_profile_dive_bomber_count_in_squadron    = "Number of aircraft in a squadron"
        default_profile_dive_bomber_count_in_squadron_max= "Maximum value"
        default_profile_dive_bomber_count_in_squadron_min= "Minimum value"
        default_profile_engine                           = "Engine"
        default_profile_engine_engine_id                 = "Engine ID"
        default_profile_engine_engine_id_str             = "Engine string ID"
        default_profile_engine_max_speed                 = "Top Speed (knots)"
        default_profile_fighters                         = "Fighters. If the module is absent on the ship, field value is null."
        default_profile_fighters_avg_damage              = "Average damage caused per second"
        default_profile_fighters_cruise_speed            = "Cruise Speed (knots)"
        default_profile_fighters_fighters_id             = "Fighters' ID"
        default_profile_fighters_fighters_id_str         = "Fighters string ID"
        default_profile_fighters_gunner_damage           = "Average damage per gunner of a fighter per second"
        default_profile_fighters_max_ammo                = "Ammunition"
        default_profile_fighters_max_health              = "Survivability"
        default_profile_fighters_name                    = "Name of squadron"
        default_profile_fighters_plane_level             = "Fighter tier"
        default_profile_fighters_prepare_time            = "Time of preparation for takeoff (sec)"
        default_profile_fighters_squadrons               = "Number of squadrons"
        default_profile_fighters_count_in_squadron       = "Number of aircraft in a squadron"
        default_profile_fighters_count_in_squadron_max   = "Maximum value"
        default_profile_fighters_count_in_squadron_min   = "Minimum value"
        default_profile_fire_control                     = "Gun Fire Control System. If the module is absent on the ship, field value is null."
        default_profile_fire_control_distance            = "Firing range"
        default_profile_fire_control_distance_increase   = "Firing Range extension (%)"
        default_profile_fire_control_fire_control_id     = "ID of Gun Fire Control System"
        default_profile_fire_control_fire_control_id_str = "String ID of Gun Fire Control System"
        default_profile_flight_control                   = "Flight Control. If the module is absent on the ship, field value is null."
        default_profile_flight_control_bomber_squadrons  = "Number of bomber squadrons"
        default_profile_flight_control_fighter_squadrons = "Number of fighter squadrons"
        default_profile_flight_control_flight_control_id = "Flight Control ID"
        default_profile_flight_control_flight_control_id_str = "Flight Control string ID"
        default_profile_flight_control_torpedo_squadrons = "Number of torpedo bomber squadrons"
        default_profile_hull                             = "Hull"
        default_profile_hull_anti_aircraft_barrels       = "AA Mounts"
        default_profile_hull_artillery_barrels           = "Number of main turrets"
        default_profile_hull_atba_barrels                = "Secondary gun turrets"
        default_profile_hull_health                      = "Hit points"
        default_profile_hull_hull_id                     = "Hull ID"
        default_profile_hull_hull_id_str                 = "Hull string ID"
        default_profile_hull_planes_amount               = "Hangar capacity"
        default_profile_hull_torpedoes_barrels           = "Torpedo tubes"
        default_profile_hull_range                       = "Armor (mm)"
        default_profile_hull_range_max                   = "Maximum value"
        default_profile_hull_range_min                   = "Minimum value"
        default_profile_mobility                         = "Maneuverability of basic configuration"
        default_profile_mobility_max_speed               = "Top Speed (knots)"
        default_profile_mobility_rudder_time             = "Rudder Shift Time (sec)"
        default_profile_mobility_total                   = "Maneuverability (%)"
        default_profile_mobility_turning_radius          = "Turning Circle Radius (m)"
        default_profile_submarine_battery                = "Dive capacity of basic configuration"
        default_profile_submarine_battery_consumption_rate = "Dive capacity depletion"
        default_profile_submarine_battery_max_capacity   = "Dive capacity"
        default_profile_submarine_battery_regen_rate     = "Dive capacity recharge rate"
        default_profile_submarine_battery_total          = "Dive capacity (%)"
        default_profile_submarine_mobility               = "Underwater maneuvering of basic configuration"
        default_profile_submarine_mobility_buoyancy_rudder_time = "Diving plane shift time"
        default_profile_submarine_mobility_max_buoyancy_speed = "Maximum dive and ascent speed"
        default_profile_submarine_mobility_max_speed_under_water = "Maximum submerged speed"
        default_profile_submarine_mobility_total         = "Underwater maneuvering (%)"
        default_profile_submarine_sonar                  = "Sonar of basic configuration"
        default_profile_submarine_sonar_submarine_sonar_id = "Sonar ID"
        default_profile_submarine_sonar_submarine_sonar_id_str = "Sonar string ID"
        default_profile_submarine_sonar_total            = "Sonar (%)"
        default_profile_submarine_sonar_wave_duration_0  = "Duration of a ping effect on a sector highlighted once"
        default_profile_submarine_sonar_wave_duration_1  = "Duration of a ping effect on a sector highlighted twice"
        default_profile_submarine_sonar_wave_max_dist    = "Maximum range"
        default_profile_submarine_sonar_wave_shot_delay  = "Reload time"
        default_profile_submarine_sonar_wave_speed_max   = "Ping velocity"
        default_profile_submarine_sonar_wave_width       = "Ping width"
        default_profile_torpedo_bomber                   = "Torpedo bombers. If the module is absent on the ship, field value is null."
        default_profile_torpedo_bomber_cruise_speed      = "Cruise Speed (knots)"
        default_profile_torpedo_bomber_gunner_damage     = "Average damage per rear gunner of a torpedo bomber per second"
        default_profile_torpedo_bomber_max_damage        = "Maximum Bomb Damage"
        default_profile_torpedo_bomber_max_health        = "Survivability"
        default_profile_torpedo_bomber_name              = "Name of squadron"
        default_profile_torpedo_bomber_plane_level       = "Torpedo bomber tier"
        default_profile_torpedo_bomber_prepare_time      = "Time of preparation for takeoff (sec)"
        default_profile_torpedo_bomber_squadrons         = "Number of squadrons"
        default_profile_torpedo_bomber_torpedo_bomber_id = "Torpedo bombers' ID"
        default_profile_torpedo_bomber_torpedo_bomber_id_str = "Torpedo bombers string ID"
        default_profile_torpedo_bomber_torpedo_damage    = "Maximum torpedo damage"
        default_profile_torpedo_bomber_torpedo_distance  = "Firing range"
        default_profile_torpedo_bomber_torpedo_max_speed = "Top Speed (knots)"
        default_profile_torpedo_bomber_torpedo_name      = "Torpedo name"
        default_profile_torpedo_bomber_count_in_squadron = "Number of aircraft in a squadron"
        default_profile_torpedo_bomber_count_in_squadron_max = "Maximum value"
        default_profile_torpedo_bomber_count_in_squadron_min = "Minimum value"
        default_profile_torpedoes                        = "Torpedo tubes. If the module is absent on the ship, field value is null."
        default_profile_torpedoes_distance               = "Firing range"
        default_profile_torpedoes_max_damage             = "Maximum Damage"
        default_profile_torpedoes_reload_time            = "Reload Time (sec)"
        default_profile_torpedoes_rotation_time          = "180 Degree Turn Time (sec)"
        default_profile_torpedoes_torpedo_name           = "Torpedo"
        default_profile_torpedoes_torpedo_speed          = "Torpedo Speed (knots)"
        default_profile_torpedoes_torpedoes_id           = "Torpedo tubes' ID"
        default_profile_torpedoes_torpedoes_id_str       = "Torpedo tubes string ID"
        default_profile_torpedoes_visibility_dist        = "Torpedo range (km)"
        default_profile_torpedoes_slots                  = "Slots for Torpedo tubes"
        default_profile_torpedoes_slots_barrels          = "Torpedo tubes per slot"
        default_profile_torpedoes_slots_caliber          = "Caliber"
        default_profile_torpedoes_slots_guns             = "Torpedo tubes"
        default_profile_torpedoes_slots_name             = "Name"
        default_profile_weaponry                         = "Armament effectiveness of basic configuration"
        default_profile_weaponry_aircraft                = "Aircraft (%)"
        default_profile_weaponry_anti_aircraft           = "AA Guns (%)"
        default_profile_weaponry_artillery               = "Artillery (%)"
        default_profile_weaponry_torpedoes               = "Torpedoes (%)"
        images                                           = "Image of a ship"
        images_contour                                   = "URL to 186 x 48 px outline image of ship"
        images_large                                     = "URL to 870 x 512 px image of ship"
        images_medium                                    = "URL to 435 x 256 px image of ship"
        images_small                                     = "URL to 214 x 126 px image of ship"
        modules                                          = "List of compatible modules"
        modules_artillery                                = "Main battery. If the module is absent on the ship, field value is null."
        modules_dive_bomber                              = "Dive bombers. If the module is absent on the ship, field value is null."
        modules_engine                                   = "Engines"
        modules_fighter                                  = "Fighters. If the module is absent on the ship, field value is null."
        modules_fire_control                             = "Gun Fire Control System. If the module is absent on the ship, field value is null."
        modules_flight_control                           = "Flight Control. If the module is absent on the ship, field value is null."
        modules_hull                                     = "Hull"
        modules_sonar                                    = "Sonar"
        modules_torpedo_bomber                           = "Torpedo bombers. If the module is absent on the ship, field value is null."
        modules_torpedoes                                = "Torpedo tubes. If the module is absent on the ship, field value is null."
        modules_tree                                     = "Module research information"
        modules_tree_is_default                          = "Indicates if the module is basic"
        modules_tree_module_id                           = "Module ID"
        modules_tree_module_id_str                       = "Module string ID"
        modules_tree_name                                = "Module name"
        modules_tree_next_modules                        = "List of module IDs available after research of the module"
        modules_tree_next_ships                          = "List of vehicle IDs available after research of the module"
        modules_tree_price_credit                        = "Cost in credits"
        modules_tree_price_xp                            = "Research cost"
        modules_tree_type                                = "Module type"
    }

    return     $fieldDescriptions
}

setFieldDescriptions
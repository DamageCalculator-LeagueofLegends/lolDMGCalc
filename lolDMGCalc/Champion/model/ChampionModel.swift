//
//  ChampionModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

struct ChampionModel: Identifiable, Codable {
    var id: Int {
        champion_id
    }

    var champion_id: Int
    var champion_name: String
    var champion_icon: String

    var champion_resource: String
    var champion_attack_type: String
    var champion_adaptive_type: String

    var champion_level: Int

    var base_health: Double
    var base_health_regen: Double
    var base_mana: Double
    var base_mana_regen: Double
    var base_armor: Double
    var base_magic_resistance: Double
    var base_attack_damage: Double

    var base_attack_speed: Double
    var base_movespeed: Double

    var health_per_level: Double
    var health_regen_per_level: Double
    var mana_per_level: Double
    var mana_regen_per_level: Double
    var armor_per_level: Double
    var magic_resistance_per_level: Double
    var attack_damage_per_level: Double
    var attack_speed_per_level: Double

    var critical_strike_damage: Double
    var critical_strike_damage_modifier: Double
    var attack_speed_ratio: Double
    var gold_per_10: Double

    var health_points_based_on_level: Double
    var health_points_regen_based_on_level: Double
    var mana_based_on_level: Double
    var mana_regen_based_on_level: Double
    var armor_based_on_level: Double
    var magic_resistance_based_on_level: Double
    var attack_damage_based_on_level: Double

    var bonus_health_points: Double
    var bonus_mana: Double
    var bonus_armor: Double
    var bonus_magic_resistance: Double
    var bonus_attack_damage: Double
    var bonus_attack_speed: Double

    var total_health_points: Double
    var total_health_regen: Double
    var total_mana: Double
    var total_mana_regen: Double
    var total_armor: Double
    var total_attack_damage: Double
    var total_attack_speed: Double
    var total_magic_resistance: Double
    var total_armor_pen_percentage: Double
    var total_magic_pen_percentage: Double
    var total_tenacity: Double
    var total_slow_resistance: Double

    var total_critical_chance: Double
    var total_lethality_flat: Double
    var total_magic_pen_flat: Double
    var total_ability_power_flat: Double
    var total_ability_haste: Double
    var total_heal_and_shield_power: Double
    var total_life_steal: Double
    var total_physical_vamp: Double
    var total_omnivamp: Double

    var has_mythic: Bool
    var number_of_legendary_items: Int
    var has_steraks_gage: Bool
    var has_rabadons_deathcap: Bool
    var has_titanic_hydra: Bool
    var has_demonic_embrace: Bool

    var mythic_armor_pen_perc: Double
    var mythic_magic_pen_perc: Double
    var mythic_tenacity: Double
    var mythic_slow_resistance: Double
    
    let q_bounds: Bounds
    let w_bounds: Bounds
    let e_bounds: Bounds
    let r_bounds: Bounds
    
    var q_name: String
    var w_name: String
    var e_name: String
    var r_name: String
}


struct Bounds: Codable {
    let lower: Int
    let upper: Int
}

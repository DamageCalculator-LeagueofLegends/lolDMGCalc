//
//  ItemModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: UUID = .init()

    var item_id: Int
    var item_name: String
    var item_icon: String

    var item_tier: Int
    var is_legendary: Bool
    var is_mythic: Bool

//    var item_builds_from: [Any]
//    var item_builds_into: [Any]

    var item_no_effects: Bool

    var item_shop_price_total: Int
    var item_shop_price_combined: Int
    var item_shop_price_sell: Int

    var item_ability_power_flat: Double
    var item_armor_flat: Double
    var item_armor_penetration_percentage: Double
    var item_attack_damage_flat: Double
    var item_attack_speed_flat: Double
    var item_critical_strike_chance_percentage: Double
    var item_gold_per_10_flat: Double
    var item_heal_and_shield_power_flat: Double
    var item_health_flat: Double
    var item_health_regen_flat: Double
    var item_lethality_flat: Double
    var item_lifesteal_percentage: Double
    var item_magic_penetration_flat: Double
    var item_magic_penetration_percentage: Double
    var item_magic_resistance_flat: Double
    var item_mana_flat: Double
    var item_mana_regen_flat: Double
    var item_movespeed_flat: Double
    var item_ability_haste_flat: Double
    var item_omnivamp_percentage: Double
    var item_tenacity_flat: Double
    var item_slow_resistance_flat: Double
    var item_physical_vamp: Double

    var mythic_armor_flat: Double
    var mythic_armor_penetration_percentage: Double
    var mythic_ability_power_flat: Double
    var mythic_attack_damage_flat: Double
    var mythic_attack_speed_flat: Double
    var mythic_heal_and_shield_power_flat: Double
    var mythic_health_flat: Double
    var mythic_lethality_flat: Double
    var mythic_magic_penetration_flat: Double
    var mythic_magic_penetration_percentage: Double
    var mythic_magic_resistance_flat: Double
    var mythic_ability_haste_flat: Double
    var mythic_omnivamp_flat_percentage: Double
    var mythic_tenacity_flat: Double
    var mythic_slow_resistance: Double
}

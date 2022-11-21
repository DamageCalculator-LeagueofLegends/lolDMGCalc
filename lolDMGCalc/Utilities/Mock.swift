//
//  Mock.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import Foundation

class Mock {
    // MARK: VMs ----------------------------------

    static var vm: ViewModel {
        return ViewModel(championService: ChampionServiceMock(), itemService: ItemServiceMock(), selectedChampion: champ1)
    }

    // MARK: Champions -------------------------------

    static var champions: [ChampionModel] {
        [champ1, champ2]
    }

    static var champ1: ChampionModel {
//        ChampionModel(champion_id: 147)
        ChampionModel(champion_id: 147, champion_name: "Seraphine", champion_icon: "https://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Seraphine.png", champion_resource: "", champion_attack_type: "", champion_adaptive_type: "", champion_level: 1, base_health: 570, base_health_regen: 6.5, base_mana: 440, base_mana_regen: 8, base_armor: 19, base_magic_resistance: 30, base_attack_damage: 55, base_attack_speed: 0.669, base_movespeed: 325, health_per_level: 104, health_regen_per_level: 0.6, mana_per_level: 40, mana_regen_per_level: 1, armor_per_level: 4.2, magic_resistance_per_level: 1.3, attack_damage_per_level: 3, attack_speed_per_level: 1, critical_strike_damage: 175, critical_strike_damage_modifier: 1.0, attack_speed_ratio: 0.625, gold_per_10: 20.4, health_points_based_on_level: 570, health_points_regen_based_on_level: 6.5, mana_based_on_level: 440, mana_regen_based_on_level: 8.0, armor_based_on_level: 19, magic_resistance_based_on_level: 30, attack_damage_based_on_level: 55, bonus_health_points: 0, bonus_mana: 0, bonus_armor: 0, bonus_magic_resistance: 0, bonus_attack_damage: 0, bonus_attack_speed: 0, total_health_points: 0, total_health_regen: 0, total_mana: 0, total_mana_regen: 0, total_armor: 0, total_attack_damage: 0, total_attack_speed: 0, total_magic_resistance: 0, total_armor_pen_percentage: 0, total_magic_pen_percentage: 0, total_tenacity: 0, total_slow_resistance: 0, total_critical_chance: 0, total_lethality_flat: 0, total_magic_pen_flat: 0, total_ability_power_flat: 0, total_ability_haste: 0, total_heal_and_shield_power: 0, total_life_steal: 0, total_physical_vamp: 0, total_omnivamp: 0, has_mythic: false, number_of_legendary_items: 0, has_steraks_gage: false, has_rabadons_deathcap: false, has_titanic_hydra: false, has_demonic_embrace: false, mythic_armor_pen_perc: 0, mythic_magic_pen_perc: 0, mythic_tenacity: 0, mythic_slow_resistance: 0, q_bounds: Bounds(lower: 0, upper: 5), w_bounds: Bounds(lower: 0, upper: 5), e_bounds: Bounds(lower: 0, upper: 5), r_bounds: Bounds(lower: 0, upper: 3), q_name: "High Note", w_name: "Surround Sound", e_name: "Beat Drop", r_name: "Encore", enemy_health: 0)
    }

    static var champ2: ChampionModel {
//        ChampionModel(champion_id: 266)
        ChampionModel(
            champion_id: 266,
            champion_name: "Aatrox",
            champion_icon: "https://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Aatrox.png",
            champion_resource: "",
            champion_attack_type: "",
            champion_adaptive_type: "",
            champion_level: 1,
            base_health: 0,
            base_health_regen: 0,
            base_mana: 0,
            base_mana_regen: 0,
            base_armor: 0,
            base_magic_resistance: 0,
            base_attack_damage: 0,
            base_attack_speed: 0,
            base_movespeed: 0,
            health_per_level: 0,
            health_regen_per_level: 0,
            mana_per_level: 0,
            mana_regen_per_level: 0,
            armor_per_level: 0,
            magic_resistance_per_level: 0,
            attack_damage_per_level: 0,
            attack_speed_per_level: 0,
            critical_strike_damage: 0,
            critical_strike_damage_modifier: 0,
            attack_speed_ratio: 0, gold_per_10: 0,
            health_points_based_on_level: 0,
            health_points_regen_based_on_level: 0,
            mana_based_on_level: 0,
            mana_regen_based_on_level: 0,
            armor_based_on_level: 0,
            magic_resistance_based_on_level: 0,
            attack_damage_based_on_level: 0,
            bonus_health_points: 0,
            bonus_mana: 0,
            bonus_armor: 0,
            bonus_magic_resistance: 0,
            bonus_attack_damage: 0,
            bonus_attack_speed: 0,
            total_health_points: 0,
            total_health_regen: 0,
            total_mana: 0,
            total_mana_regen: 0,
            total_armor: 0,
            total_attack_damage: 0,
            total_attack_speed: 0,
            total_magic_resistance: 0,
            total_armor_pen_percentage: 0,
            total_magic_pen_percentage: 0,
            total_tenacity: 0,
            total_slow_resistance: 0,
            total_critical_chance: 0,
            total_lethality_flat: 0,
            total_magic_pen_flat: 0,
            total_ability_power_flat: 0,
            total_ability_haste: 0,
            total_heal_and_shield_power: 0,
            total_life_steal: 0,
            total_physical_vamp: 0,
            total_omnivamp: 0,
            has_mythic: false,
            number_of_legendary_items: 0,
            has_steraks_gage: false,
            has_rabadons_deathcap: false,
            has_titanic_hydra: false,
            has_demonic_embrace: false,
            mythic_armor_pen_perc: 0,
            mythic_magic_pen_perc: 0,
            mythic_tenacity: 0,
            mythic_slow_resistance: 0,
            q_bounds: Bounds(lower: 0, upper: 5),
            w_bounds: Bounds(lower: 0, upper: 5),
            e_bounds: Bounds(lower: 0, upper: 5),
            r_bounds: Bounds(lower: 0, upper: 3),
            q_name: "The Darkin Blade",
            w_name: "Infernal Chains",
            e_name: "Umbral Dash",
            r_name: "World Ender",
            enemy_health: 0
        )
    }

    // MARK: Items --------------------------------

    static var items: [ItemModel] {
        [item1, item2]
    }

    static var item1: ItemModel {
        ItemModel(item_id: 6655, item_name: "Luden's Tempest", item_icon: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6655_mage_t4_ludenstempest.png", item_tier: 3, is_legendary: false, is_mythic: true, item_no_effects: false, item_shop_price_total: 0, item_shop_price_combined: 0, item_shop_price_sell: 0, item_ability_power_flat: 80, item_armor_flat: 0, item_armor_penetration_percentage: 0, item_attack_damage_flat: 0, item_attack_speed_flat: 0, item_critical_strike_chance_percentage: 0, item_gold_per_10_flat: 0, item_heal_and_shield_power_flat: 0, item_health_flat: 0, item_health_regen_flat: 0, item_lethality_flat: 0, item_lifesteal_percentage: 0, item_magic_penetration_flat: 6, item_magic_penetration_percentage: 0, item_magic_resistance_flat: 0, item_mana_flat: 600, item_mana_regen_flat: 0, item_movespeed_flat: 0, item_ability_haste_flat: 20, item_omnivamp_percentage: 0, item_tenacity_flat: 0, item_slow_resistance_flat: 0, item_physical_vamp: 0, mythic_armor_flat: 0, mythic_armor_penetration_percentage: 0, mythic_ability_power_flat: 0, mythic_attack_damage_flat: 0, mythic_attack_speed_flat: 0, mythic_heal_and_shield_power_flat: 0, mythic_health_flat: 0, mythic_lethality_flat: 0, mythic_magic_penetration_flat: 5, mythic_magic_penetration_percentage: 0, mythic_magic_resistance_flat: 0, mythic_ability_haste_flat: 0, mythic_omnivamp_flat_percentage: 0, mythic_tenacity_flat: 0, mythic_slow_resistance: 0, has_active: false, is_unique: true)
    }

    static var item2: ItemModel {
        ItemModel(item_id: 6653, item_name: "Liandry's Anguish", item_icon: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6653_mage_t4_liandrysanguish.png", item_tier: 3, is_legendary: false, is_mythic: true, item_no_effects: false, item_shop_price_total: 0, item_shop_price_combined: 0, item_shop_price_sell: 0, item_ability_power_flat: 80, item_armor_flat: 0, item_armor_penetration_percentage: 0, item_attack_damage_flat: 0, item_attack_speed_flat: 0, item_critical_strike_chance_percentage: 0, item_gold_per_10_flat: 0, item_heal_and_shield_power_flat: 0, item_health_flat: 0, item_health_regen_flat: 0, item_lethality_flat: 0, item_lifesteal_percentage: 0, item_magic_penetration_flat: 0, item_magic_penetration_percentage: 0, item_magic_resistance_flat: 0, item_mana_flat: 600, item_mana_regen_flat: 0, item_movespeed_flat: 0, item_ability_haste_flat: 20, item_omnivamp_percentage: 0, item_tenacity_flat: 0, item_slow_resistance_flat: 0, item_physical_vamp: 0, mythic_armor_flat: 0, mythic_armor_penetration_percentage: 0, mythic_ability_power_flat: 0, mythic_attack_damage_flat: 0, mythic_attack_speed_flat: 0, mythic_heal_and_shield_power_flat: 0, mythic_health_flat: 0, mythic_lethality_flat: 0, mythic_magic_penetration_flat: 0, mythic_magic_penetration_percentage: 0, mythic_magic_resistance_flat: 0, mythic_ability_haste_flat: 5, mythic_omnivamp_flat_percentage: 0, mythic_tenacity_flat: 0, mythic_slow_resistance: 0, has_active: true, is_unique: true)
    }
}

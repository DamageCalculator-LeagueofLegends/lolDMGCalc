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
        ChampionModel(tpye: "CHAMPION", mayAttack: true, champLevel: 1, champBasedOnLevelStats: ChampBasedOnLevelStats(healthPoints: 570, healthPointsRegen: 6.5, mana: 440, manaRegen: 8, armor: 19, magicResistance: 30, attackDamage: 55), champBonusStats: ChampBonusStats(healthPoints: 0, mana: 0, armor: 0, magicResistance: 0, attackDamage: 0, attackSpeed: 0), champUtilInfo: ChampUtilInfo(hasMythic: false, enemyMaxHealth: 0, enemyCurrentHealth: 0, baseHealthRegen: 0, baseManaRegen: 0), champMissingHealthAmpInfo: ChampMissingHealthAmpInfo(damageAmplifier: 0, perPercentage: 0, cappedAt: 0), champScalingValues: ["AD": 0], champID: 147, champName: "Seraphine", champIcon: "https://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Seraphine.png", attackSpeedRatio: 0.699, champAbilities: nil, champBounds: ChampBounds(q: BoundsClass(lower: 0, upper: 4), w: BoundsClass(lower: 0, upper: 4), e: BoundsClass(lower: 0, upper: 4), r: BoundsClass(lower: 0, upper: 2)), champTotalStats: ChampTotalStats(healthPoints: 0, mana: 0, manaRegen: 0, armor: 0, magicResistance: 0, attackDamage: 0, attackSpeed: 0, criticalChance: 0, lethalityFlat: 0, magicPenFlat: 0, abilityPower: 0, abilityHaste: 0, healAndShieldPower: 0, lifeSteal: 0, omnivamp: 0, physicalVamp: 0, healthRegen: 0, armorPenPercentage: 0, magicPenPercentage: 0, tenacity: 0, slowResistance: 0), combatStats: CombatStats(armor: 0, magicResistance: 0, totalHealth: 0, currentHealth: 0))
    }

    static var champ2: ChampionModel {
        ChampionModel(tpye: "CHAMPION", mayAttack: true, champLevel: 1, champBasedOnLevelStats: ChampBasedOnLevelStats(healthPoints: 570, healthPointsRegen: 6.5, mana: 440, manaRegen: 8, armor: 19, magicResistance: 30, attackDamage: 55), champBonusStats: ChampBonusStats(healthPoints: 0, mana: 0, armor: 0, magicResistance: 0, attackDamage: 0, attackSpeed: 0), champUtilInfo: ChampUtilInfo(hasMythic: false, enemyMaxHealth: 0, enemyCurrentHealth: 0, baseHealthRegen: 0, baseManaRegen: 0), champMissingHealthAmpInfo: ChampMissingHealthAmpInfo(damageAmplifier: 0, perPercentage: 0, cappedAt: 0), champScalingValues: ["AD": 0], champID: 266, champName: "Aatrox", champIcon: "https://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Aatrox.png", attackSpeedRatio: 0.699, champAbilities: nil, champBounds: ChampBounds(q: BoundsClass(lower: 0, upper: 4), w: BoundsClass(lower: 0, upper: 4), e: BoundsClass(lower: 0, upper: 4), r: BoundsClass(lower: 0, upper: 2)), champTotalStats: ChampTotalStats(healthPoints: 0, mana: 0, manaRegen: 0, armor: 0, magicResistance: 0, attackDamage: 0, attackSpeed: 0, criticalChance: 0, lethalityFlat: 0, magicPenFlat: 0, abilityPower: 0, abilityHaste: 0, healAndShieldPower: 0, lifeSteal: 0, omnivamp: 0, physicalVamp: 0, healthRegen: 0, armorPenPercentage: 0, magicPenPercentage: 0, tenacity: 0, slowResistance: 0), combatStats: CombatStats(armor: 0, magicResistance: 0, totalHealth: 0, currentHealth: 0))
    }


    // MARK: Items --------------------------------

    static var items: [ItemModel] {
        [item1, item2]
    }

    static var item1: ItemModel {
        ItemModel(isLegendary: false, isMythic: true, hasActive: false, isUnique: true, itemID: 6653, itemName: "Liandry's Anguish", itemIcon: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6653_mage_t4_liandrysanguish.png", itemStats: nil, mythicStats: nil)
    }

    static var item2: ItemModel {
        ItemModel(isLegendary: false, isMythic: true, hasActive: false, isUnique: true, itemID: 6655, itemName: "Luden's Tempest", itemIcon: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6655_mage_t4_ludenstempest.png", itemStats: nil, mythicStats: nil)
    }
    // MARK: Actions --------------------------------
    static var actionConditionsList: [ActionAndCondition] {
        [ActionAndCondition(ability: "AA", conditions: nil), ActionAndCondition(ability: "Q", conditions: nil), ActionAndCondition(ability: "AA", conditions: nil), ActionAndCondition(ability: "E", conditions: actionCond1), ActionAndCondition(ability: "E", conditions: actionCond2), ActionAndCondition(ability: "R", conditions: actionCond1)]
    }
    static var actionCond1: ActionConditions {
        ActionConditions(conditions: [Condition(type: "firstInstance", value: Value.bool(true)), Condition(type: "secondInstance", value: Value.bool(false))])
    }
    static var actionCond2: ActionConditions {
        ActionConditions(conditions: [Condition(type: "firstInstance", value: Value.bool(true)), Condition(type: "secondInstance", value: Value.bool(true))])
    }
}

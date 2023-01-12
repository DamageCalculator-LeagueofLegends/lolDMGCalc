//
//  ChampionModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

struct ChampionModel: Codable, Identifiable {
    var id: Int {
        champID
    }

    let tpye: String
    let mayAttack: Bool
    let champLevel: Double
    let champBasedOnLevelStats: ChampBasedOnLevelStats
    let champBonusStats: ChampBonusStats
    // let champItems: [ItemModel]
    let champUtilInfo: ChampUtilInfo
    let champMissingHealthAmpInfo: ChampMissingHealthAmpInfo
    let champScalingValues: [String: Double]
    let champID: Int
    let champName: String
    let champIcon: String
    let attackSpeedRatio: Double
    let champAbilities: ChampAbilities?
    let champBounds: ChampBounds
    let champTotalStats: ChampTotalStats
    let combatStats: CombatStats

    enum CodingKeys: String, CodingKey {
        case tpye, mayAttack, champLevel, champBasedOnLevelStats, champBonusStats, champUtilInfo, champMissingHealthAmpInfo, champScalingValues, champID, champName, champIcon, attackSpeedRatio, champAbilities
        case champBounds = "_champBounds"
        case champTotalStats, combatStats
    }
}

// MARK: - ChampAbilities

struct ChampAbilities: Codable {
    let q, w, e, r: ChampAbilitiesData

    enum CodingKeys: String, CodingKey {
        case q = "Q"
        case w = "W"
        case e = "E"
        case r = "R"
    }
}

// MARK: - ChampAbilities

struct ChampAbilitiesData: Codable {
    let dynamicData: DynamicData
    let staticData: [StaticData]
}

// MARK: - DynamicData

struct DynamicData: Codable {
    let bounds: BoundsClass
    let scalingValues: [String: Double]?
    let actionConditions: ActionConditions?
    let skillLevel: Int?
    let attributeIndicies: AbilityAtributeIndicies?
}

struct ActionConditions: Codable {
    let conditions: [Condition]?
}

struct Condition: Codable {
    let type: String
    let value: Value?
}

enum Value: Codable {
    case bool(Bool)
    case double(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .double(let x):
            try container.encode(x)
        }
    }
}

struct AbilityAtributeIndicies: Codable {
    let leveling, ability, effect: Int
}

// MARK: - BoundsClass

struct BoundsClass: Codable {
    let lower, upper: Int
}

// MARK: - StaticDatum

struct StaticData: Codable {
    let name: String
    let icon: String
    let effects: [Effect]?
    let cost: Cost?
    let cooldown: Cooldown
    let targeting, affects: String
    let spellshieldable: String?
    let resource: String?
    let damageType, spellEffects, projectile: String?
    let onHitEffects, occurrence, missileSpeed, rechargeRate: String?
    let collisionRadius, tetherRadius, onTargetCDStatic, innerRadius: String?
    let speed, width: String?
    let angle: String?
    let castTime: String
    let effectRadius, targetRange: String?

    enum CodingKeys: String, CodingKey {
        case name, icon, effects, cost, cooldown, targeting, affects, spellshieldable, resource, damageType, spellEffects, projectile, onHitEffects, occurrence, missileSpeed, rechargeRate, collisionRadius, tetherRadius
        case onTargetCDStatic = "onTargetCdStatic"
        case innerRadius, speed, width, angle, castTime, effectRadius, targetRange
    }
}

struct Cost: Codable {
    let modifiers: [Modifier]
}

// MARK: - Cooldown

struct Cooldown: Codable {
    let modifiers: [Modifier]
    let affectedByCdr: Bool
}

// MARK: - Modifier

struct Modifier: Codable {
    let values: [Double]
    let units: [String]?
}

enum Unit: String, Codable {
    case ad = "% AD"
    case empty = ""
    case unit = "%"
}

enum ScalingValuesNames: String, Codable {
    case ad = "% AD"
    case ap = "% AP"
    case bonusAD = "% bonus AD"
}

// MARK: - Effect

struct Effect: Codable {
    let leveling: [Leveling]?
}

// MARK: - Leveling

struct Leveling: Codable {
    let attribute: String
    let modifiers: [Modifier]?
}

// MARK: - ChampBasedOnLevelStats

struct ChampBasedOnLevelStats: Codable {
    let healthPoints, healthPointsRegen, mana, manaRegen: Double
    let armor, magicResistance, attackDamage: Double
}

// MARK: - ChampBonusStats

struct ChampBonusStats: Codable {
    let healthPoints, mana, armor, magicResistance: Double
    let attackDamage, attackSpeed: Double
}

// MARK: - ChampBounds

struct ChampBounds: Codable {
    let q, w, e, r: BoundsClass

    enum CodingKeys: String, CodingKey {
        case q = "Q"
        case w = "W"
        case e = "E"
        case r = "R"
    }
}

// MARK: - ChampMissingHealthAmpInfo

struct ChampMissingHealthAmpInfo: Codable {
    let damageAmplifier, perPercentage, cappedAt: Double
}

// MARK: - ChampUtilInfo

struct ChampUtilInfo: Codable {
    let hasMythic: Bool
    let enemyMaxHealth, enemyCurrentHealth, baseHealthRegen, baseManaRegen: Double
}

// MARK: - CombatStats

struct CombatStats: Codable {
    let armor, magicResistance, totalHealth, currentHealth: Double
}

// MARK: - ChampTotalStats

struct ChampTotalStats: Codable {
    let healthPoints, mana, manaRegen, armor, magicResistance: Double
    let attackDamage, attackSpeed, criticalChance, lethalityFlat: Double
    let magicPenFlat, abilityPower, abilityHaste, healAndShieldPower: Double
    let lifeSteal, omnivamp, physicalVamp, healthRegen, armorPenPercentage: Double
    let magicPenPercentage, tenacity, slowResistance: Double
}

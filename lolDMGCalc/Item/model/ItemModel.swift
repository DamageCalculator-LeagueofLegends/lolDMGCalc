//
//  ItemModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import Foundation



// MARK: - Welcome
struct ItemModel: Codable, Identifiable {
    var id: Int {
        itemID
    }

    let isLegendary, isMythic, hasActive, isUnique: Bool
    let itemID: Int
    let itemName: String
    let itemIcon: String
    let itemStats, mythicStats: [String: Stat]?
}

// MARK: - Stat
struct Stat: Codable {
    let flat, percent, perLevel, percentPerLevel: Int
    let percentBase, percentBonus: Int
}

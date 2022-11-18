//
//  AbilityLevel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import Foundation

struct AbilityLevel {
    
    var levels: [Level] = [Level(description: "Q"), Level(description: "W"), Level(description: "E"), Level(description: "R")]
    
    mutating public func newValue(_ value: Int, for description: String) {
        if let index = getLevelIndex(description) {
            levels[index].newValue(value)
        }
    }
    
    func isAvaliable(_ description: String) -> Bool {
        if let index = getLevelIndex(description) {
            return levels[index].available
        }
        return false
    }
    
    private func getLevelIndex(_ description: String) -> Int? {
        return levels.firstIndex(where: {$0.description == description})
    }
}

struct Level {
    let description: String
    var value: Int = 0
    
    var available: Bool {
        value > 0
    }
    
    public mutating func newValue(_ value: Int) {
        self.value = value
    }
}

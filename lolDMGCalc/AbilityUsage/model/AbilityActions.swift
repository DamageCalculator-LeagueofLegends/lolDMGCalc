//
//  AbilityActions.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import Foundation

struct Action: Identifiable, Hashable {
    var id: UUID = .init()

    var name: String
    var fullName: String
    var damage: Double
}

enum ActionData {
    static var everything: [Action] {
        [autoAttack, q, w, e, r, itemActiveOne, itemActiveTwo, itemActiveThree, itemActiveFour, itemActiveFive, itemActiveSix]
    }

    static var autoAttack: Action {
        Action(name: "AA", fullName: "Auto Attack", damage: 0)
    }
    
    // MARK: Abilities -----------------------------------------------------

    static var abilities: [Action] {
        [q, w, e, r]
    }
    
    static var q: Action {
        Action(name: "Q", fullName: "Q Ability", damage: 0)
    }

    static var w: Action {
        Action(name: "W", fullName: "W Ability", damage: 0)
    }

    static var e: Action {
        Action(name: "E", fullName: "E Ability", damage: 0)
    }

    static var r: Action {
        Action(name: "R", fullName: "R Ability", damage: 0)
    }
    
    
    // MARK: Items ---------------------------------------------------------
    
    static var items: [Action] {
        [itemActiveOne, itemActiveTwo, itemActiveThree, itemActiveFour, itemActiveFive, itemActiveSix]
    }

    static var itemActiveOne: Action {
        Action(name: "IA1", fullName: "Item Active 1", damage: 0)
    }

    static var itemActiveTwo: Action {
        Action(name: "IA2", fullName: "Item Active 2", damage: 0)
    }

    static var itemActiveThree: Action {
        Action(name: "IA3", fullName: "Item Active 3", damage: 0)
    }

    static var itemActiveFour: Action {
        Action(name: "IA4", fullName: "Item Active 4", damage: 0)
    }

    static var itemActiveFive: Action {
        Action(name: "IA5", fullName: "Item Active 5", damage: 0)
    }

    static var itemActiveSix: Action {
        Action(name: "IA6", fullName: "Item Active 6", damage: 0)
    }
}

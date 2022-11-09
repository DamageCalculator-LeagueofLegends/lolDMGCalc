//
//  Mock.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import Foundation

class Mock {
    
    // MARK: Champions -------------------------------
    
    static var champions: [Champion] {
        [champ1, champ2]
    }
    
    static var champ1: Champion {
        Champion(name: "Seraphine", logo: "SERA", level: 1)
    }
    
    static var champ2: Champion {
        Champion(name: "Aatrox", logo: "AAT", level: 1)
    }
    
    // MARK: Items --------------------------------
    
    static var items: [Item] {
        [item1,item2]
    }
    
    static var item1: Item {
        Item(name: "Luden's Tempest", logo: "LT")
    }
    
    static var item2: Item {
        Item(name: "Liandry's Anguish", logo: "LA")
    }
}

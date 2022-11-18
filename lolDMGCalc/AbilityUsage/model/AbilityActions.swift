//
//  AbilityActions.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import Foundation

struct Action: Identifiable, Hashable {
    var id: UUID = UUID()
    
    var name: String
    var available: Bool
    var chosen: Bool
}

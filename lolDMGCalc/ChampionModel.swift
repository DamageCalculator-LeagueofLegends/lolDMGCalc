//
//  ChampionModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation


struct Champion: Identifiable{
    var id: UUID = UUID()
    var name: String
    var logo: String
}

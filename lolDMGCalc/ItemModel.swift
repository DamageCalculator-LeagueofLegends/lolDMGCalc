//
//  ItemModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import Foundation

struct Item: Identifiable {
    var id: UUID = UUID()
    var name: String
    var logo: String
}

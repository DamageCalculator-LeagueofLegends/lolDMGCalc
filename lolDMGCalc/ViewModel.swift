//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var champion_list: [Champion] = []
    
    init(){
    }
}

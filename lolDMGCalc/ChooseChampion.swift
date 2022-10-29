//
//  ChooseChampion.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import SwiftUI

struct ChooseChampion: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        Text(vm.$name)
    }
}

struct ChooseChampion_Previews: PreviewProvider {
    static var previews: some View {
        ChooseChampion(vm: ViewModel())
    }
}

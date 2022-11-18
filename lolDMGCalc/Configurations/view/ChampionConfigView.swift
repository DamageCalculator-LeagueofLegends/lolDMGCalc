//
//  ChampionConfigView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct ChampionConfigView: View {
    @ObservedObject var vm: ViewModel

    var body: some View {
        VStack {
            ChampionLevelSliderView(vm: vm)
                .padding(.horizontal)
            
            Divider()
            AbilityLevelView(vm: vm, description: "Q")
            Divider()
            AbilityLevelView(vm: vm, description: "W")
            Divider()
            AbilityLevelView(vm: vm, description: "E")
            Divider()
            AbilityLevelView(vm: vm, description: "R")

            Spacer()
        }
    }
}

struct ChampionConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionConfigView(vm: ViewModel())
    }
}

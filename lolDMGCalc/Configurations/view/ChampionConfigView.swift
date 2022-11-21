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
            
            if let champion = vm.selectedChampion {
                
                Divider()
                AbilityLevelView(vm: vm, description: "Q", lower: champion.q_bounds.lower, upper: champion.q_bounds.upper)
                Divider()
                AbilityLevelView(vm: vm, description: "W", lower: champion.w_bounds.lower, upper: champion.w_bounds.upper)
                Divider()
                AbilityLevelView(vm: vm, description: "E", lower: champion.e_bounds.lower, upper: champion.e_bounds.upper)
                Divider()
                AbilityLevelView(vm: vm, description: "R", lower: champion.r_bounds.lower, upper: champion.r_bounds.upper)
            }

            Spacer()
        }
    }
}

struct ChampionConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionConfigView(vm: ViewModel())
    }
}

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
            AbilityLevelView(vm: vm, description: "Q",lower: vm.selectedChampion?.q_bounds.lower ?? 0, upper: vm.selectedChampion?.q_bounds.upper ?? 5 )
            Divider()
            AbilityLevelView(vm: vm, description: "W", lower: vm.selectedChampion?.w_bounds.lower ?? 0, upper: vm.selectedChampion?.w_bounds.upper ?? 5 )
            Divider()
            AbilityLevelView(vm: vm, description: "E" ,lower: vm.selectedChampion?.e_bounds.lower ?? 0, upper: vm.selectedChampion?.e_bounds.upper ?? 5 )
            Divider()
            AbilityLevelView(vm: vm, description: "R", lower: vm.selectedChampion?.r_bounds.lower ?? 0, upper: vm.selectedChampion?.r_bounds.upper ?? 3 )

            Spacer()
        }
    }
}

struct ChampionConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionConfigView(vm: ViewModel())
    }
}

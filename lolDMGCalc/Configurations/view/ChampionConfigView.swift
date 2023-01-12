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
                AbilityLevelView(vm: vm, description: "Q", lower: Int(champion.champBounds.q.lower), upper: Int(champion.champBounds.q.upper))
                Divider()
                AbilityLevelView(vm: vm, description: "W", lower: Int(champion.champBounds.w.lower), upper: Int(champion.champBounds.w.upper))
                Divider()
                AbilityLevelView(vm: vm, description: "E", lower: Int(champion.champBounds.e.lower), upper: Int(champion.champBounds.e.upper))
                Divider()
                AbilityLevelView(vm: vm, description: "R", lower: Int(champion.champBounds.r.lower), upper: Int(champion.champBounds.r.upper))
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

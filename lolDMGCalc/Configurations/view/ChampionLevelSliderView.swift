//
//  ChampionLevelSliderView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct ChampionLevelSliderView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        VStack {
            Text("Champion Level:")
            HStack {
                Slider(value: $vm.championLevel, in: 1...18, step: 1) {
                    Text("Level")
                }

                Text("\(Int(vm.championLevel))")
            }
        }
    }
}

struct ChampionLevelSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionLevelSliderView(vm: ViewModel())
    }
}

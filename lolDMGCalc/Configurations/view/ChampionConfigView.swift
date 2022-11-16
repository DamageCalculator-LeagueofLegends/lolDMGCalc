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
        ScrollView {
            VStack {
                ChampionLevelSliderView(vm: vm)
                ForEach(LevelKind.allCases, id: \.self) { level in
                    Divider()
                    AbilityLevelView(vm: vm, levelKind: level)
                }
                
                Spacer()
            }
        }
        .padding(20)
//        .background(Color("White"))
        .cornerRadius(10)
        .padding(20)
        .background(Material.ultraThin)
    }
}

struct ChampionConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionConfigView(vm: ViewModel())
    }
}

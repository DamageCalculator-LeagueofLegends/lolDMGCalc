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
            ForEach(LevelKind.allCases, id: \.self) { level in
                Divider()
                AbilityLevelView(vm: vm, levelKind: level)
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

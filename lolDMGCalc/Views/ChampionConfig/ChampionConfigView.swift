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
        List {
            ChampionLevelSliderView(vm: vm)

            ForEach(LevelKind.allCases, id: \.self) { level in
                AbilityLevelView(vm: vm, levelKind: level)
            }

//            AbilityLevelView(vm: vm, levelKind: .q)
//            AbilityLevelView(vm: vm, levelKind: .w)
//            AbilityLevelView(vm: vm, levelKind: .e)
//            AbilityLevelView(vm: vm, levelKind: .r)

            Button {
                vm.testApi()
            } label: {
                Text("apiTest")
            }
        }
    }
}

struct ChampionConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionConfigView(vm: ViewModel())
    }
}

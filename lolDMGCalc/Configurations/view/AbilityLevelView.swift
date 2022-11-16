//
//  AbilityLevelView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct AbilityLevelView: View {
    @ObservedObject var vm: ViewModel
    
    let levelKind: LevelKind
    
    @State private var value: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(levelKind.rawValue) Level:")
                .frame(minWidth: 65)
            Picker("Pick", selection: $value) {
                ForEach(0 ..< 6) { i in
                    Text("\(i)").tag(i)
                }
            }
            .pickerStyle(.segmented)
            .onChange(of: value) { newValue in
                vm.abilityLevel.newValue(newValue, for: levelKind)
            }
        }
    }
}

struct AbilityLevelView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityLevelView(vm: ViewModel(), levelKind: .q)
    }
}

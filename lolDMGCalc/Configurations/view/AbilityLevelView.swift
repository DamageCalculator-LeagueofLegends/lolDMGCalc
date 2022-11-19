//
//  AbilityLevelView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct AbilityLevelView: View {
    @ObservedObject var vm: ViewModel
    
    let description: String
    
    @State var value: Int = 0
    
    let lower: Int
    let upper: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(description) Level:")
                .frame(minWidth: 65)
            Picker("Pick", selection: $value) {
                ForEach(lower ..< upper + 1, id: \.self) { i in
                    Text("\(i)").tag(i)
                }
            }
            .onAppear {
                value = lower
            }
            .pickerStyle(.segmented)
            .onChange(of: value) { newValue in
                vm.selectedActions = vm.selectedActions.filter({$0.name != description})
//                var tempNum: [Int] = []
//                if value == 0 {
//                    for index in vm.selectedActions.indices {
//                        if vm.selectedActions[index].name == description {
//
//                            tempNum.append(index)
//                        }
//                    }
//                    for i in tempNum {
//                        vm.selectedActions.remove(at: i)
//                    }
//                }
                vm.abilityLevel.newValue(newValue, for: description)
            }
        }
    }
}

struct AbilityLevelView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityLevelView(vm: ViewModel(), description: "Q", value: 0, lower: 0, upper: 5)
    }
}

//
//  ChooseDummyStatsView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct ChooseDummyStatsView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Health")
                    TextField("Health", value: $vm.dummy.health, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                }
                VStack(alignment: .leading) {
                    Text("Armor")
                    TextField("Health", value: $vm.dummy.armor, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                }
                
                VStack(alignment: .leading) {
                    Text("Magic Res")
                    TextField("Health", value: $vm.dummy.magicResistance, format: .number)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                }
                
            }
        }
    }
}

struct ChooseDummyStatsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChooseDummyStatsView(vm: Mock.vm)
        }
    }
}

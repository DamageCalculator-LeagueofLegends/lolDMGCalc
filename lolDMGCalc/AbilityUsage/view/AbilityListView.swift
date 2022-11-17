//
//  AbilityListView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct AbilityListView: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        VStack {
            ForEach(vm.selectedActions) { abc in
                if abc.chosen {
                    Text(abc.name)
                }
            }
        }
    }
}

struct AbilityListView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityListView(vm: Mock.vm)
    }
}
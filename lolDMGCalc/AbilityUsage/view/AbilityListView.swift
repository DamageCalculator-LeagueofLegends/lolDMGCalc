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
            ForEach(0..<vm.selectedActions.count, id: \.self) { actionNumber in
                SelectedAbilitiesView(vm: vm, selectedActionNumber: actionNumber, selectedAction: vm.selectedActions[actionNumber])
            }
        }
        .padding(.vertical)
    }
}

struct AbilityListView_Previews: PreviewProvider {
    static var previews: some View {
        AbilityListView(vm: Mock.vm)
    }
}

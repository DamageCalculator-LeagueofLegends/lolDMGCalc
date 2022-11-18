//
//  SelectedAbilitiesView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 18.11.22.
//

import SwiftUI

struct SelectedAbilitiesView: View {
    @ObservedObject var vm: ViewModel
    var selectedActionNumber: Int
    var selectedAction: Action
    var body: some View {
        HStack {
            Text(selectedAction.fullName)
                .frame(width: 150, alignment: .leading)
            Button {
                vm.selectedActions.remove(at: selectedActionNumber)
            } label: {
                Image(systemName: "minus.circle")
            }
            Spacer()
            Text(String(format: "%.2f", selectedAction.damage))
        }
        .padding(5)
        .background(.opacity(0.2))
        .cornerRadius(7)
    }
}

struct SelectedAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedAbilitiesView(vm: Mock.vm, selectedActionNumber: 0, selectedAction: ActionData.autoAttack)
    }
}

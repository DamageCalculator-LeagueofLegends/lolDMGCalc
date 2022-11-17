//
//  AvailableAbilitiesView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct AvailableAbilitiesView: View {
    @ObservedObject var vm: ViewModel
    @State var tempAction: Action = Action(name: "", available: false, chosen: false)

    var body: some View {
        VStack {
            ForEach(vm.availableActions) { action in
                if action.available {
                    Button {
                        self.tempAction = action
                        self.tempAction.chosen = true
                        vm.selectedActions.append(self.tempAction)
                    } label: {
                        Text(action.name)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

struct AvailableAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableAbilitiesView(vm: Mock.vm, tempAction: Mock.action1)
    }
}

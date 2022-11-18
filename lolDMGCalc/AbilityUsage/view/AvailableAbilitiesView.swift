//
//  AvailableAbilitiesView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct AvailableAbilitiesView: View {
    @ObservedObject var vm: ViewModel
    @State var hasActiveItems: Bool = true

    var body: some View {
        VStack {
            basicAbilities
            itemActives
            
        }
    }

    var basicAbilities: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.selectableAbilities) { action in

                    Button {
                        var tempAct: Action = action
                        if action.name == "Q" {
                            tempAct.fullName = vm.selectedChampion?.q_name ?? action.fullName
                        } else if action.name == "W" {
                            tempAct.fullName = vm.selectedChampion?.w_name ?? action.fullName
                        } else if action.name == "E" {
                            tempAct.fullName = vm.selectedChampion?.e_name ?? action.fullName
                        } else if action.name == "R" {
                            tempAct.fullName = vm.selectedChampion?.r_name ?? action.fullName
                        }
                        vm.selectedActions.append(tempAct)
                    } label: {
                        Text(action.name)
                            .font(.system(size: 23))
                            .padding(4)
                            .frame(width: 55)
                            .background(.gray.opacity(0.3))
                            .cornerRadius(6)
                    }
                }
            }
        }
    }

    var itemActives: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.selectableAcitveItems) { action in
                    Button {
                        vm.selectedActions.append(action)
                    } label: {
                        Text(action.name)
                            .font(.system(size: 23))
                            .padding(4)
                            .frame(width: 55)
                            .background(.gray.opacity(0.3))
                            .cornerRadius(6)
                    }
                }
            }
        }
    }
}

struct AvailableAbilitiesView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AvailableAbilitiesView(vm: Mock.vm)
        }
    }
}

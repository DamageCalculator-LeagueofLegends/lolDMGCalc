//
//  AddNewAbility.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct AddNewAbility: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        NavigationLink {
            AvailableAbilitiesView(vm: vm)
        } label: {
            HStack {
                Text("Choose Ability")
                Image(systemName: "plus")
            }
        }
        .buttonStyle(.bordered)
    }
}

struct AddNewAbility_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddNewAbility(vm: Mock.vm)
        }
    }
}

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
            ScrollViewReader { value in
                ForEach(0 ..< vm.selectedActions.count, id: \.self) { actionNumber in
                    SelectedAbilitiesView(vm: vm, selectedActionNumber: actionNumber, selectedAction: vm.selectedActions[actionNumber])
                }
                .onChange(of: vm.selectedActions.count) { _ in
                    withAnimation {
                        value.scrollTo(vm.selectedActions.count - 1)
                    }
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

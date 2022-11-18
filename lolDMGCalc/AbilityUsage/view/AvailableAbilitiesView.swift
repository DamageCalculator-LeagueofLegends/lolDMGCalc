//
//  AvailableAbilitiesView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.11.22.
//

import SwiftUI

struct AvailableAbilitiesView: View {
    @ObservedObject var vm: ViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.availableActions) { action in
                    if action.available {
                        Button {
                            vm.selectedActions.append(action)
                        } label: {
                            Text(action.name)
                                .font(.system(size: 23))
                                .padding(4)
                                .frame(width:55)
                                .background(.gray.opacity(0.3))
                                .cornerRadius(6)
                        }
                        
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

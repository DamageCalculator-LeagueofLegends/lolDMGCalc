//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel

    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top) {
                ChooseChampionButtonView(vm: vm)
                ChooseItemButtonsView(vm: vm)
            }
            .padding(.top, 10)
            ScrollView {
                ChampionConfigView(vm: vm)
                Divider()
                ChooseDummyStatsView(vm: vm)
                Divider()
                AddNewAbility(vm: vm)
                AbilityListView(vm: vm)
            }
            .padding(20)
            //        .background(Color("White"))
            .cornerRadius(10)
            .padding(20)
            .background(Material.ultraThin)
        }
        .alert(vm.error?.localizedDescription ?? "", isPresented: $vm.showingError) {
            Button("reload") {
                vm.showingError = false
                Task {
                    await vm.fetchChampions()
                }
            }
        }
        .environmentObject(vm)
        .navigationTitle("Dmg Calc")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(vm: Mock.vm)
        }
    }
}

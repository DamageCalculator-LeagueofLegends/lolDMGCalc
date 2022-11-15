//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()

    var body: some View {
        VStack {
            ChooseChampionButtonView(vm: vm)
            ChooseItemButtonsView(vm: vm)
            ChampionConfigView(vm: vm)
        }
        .task {
            await vm.testApi()
        }
        .alert(vm.error?.localizedDescription ?? "", isPresented: $vm.showingError) {
            Button("reload") {
                vm.showingError = false
                Task {
                    await vm.testApi()
                }
            }
        }
        .environmentObject(vm)
        .navigationTitle("Dmg Calc")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = .init()

    var body: some View {
        VStack {
            ChooseChampionButtonView()
            ChooseItemButtonsView(vm: vm)
            ChampionConfigView(vm: vm)
        }
        .environmentObject(vm)
        .navigationTitle("Dmg Calculator")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}

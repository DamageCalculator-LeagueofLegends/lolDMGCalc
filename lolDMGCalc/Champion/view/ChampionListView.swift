//
//  ChampionListView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import SwiftUI

struct ChampionListView: View {
    @ObservedObject var vm: ViewModel
    @State var text: String = ""

    var body: some View {
        List {
            ForEach(vm.championList) { champion in
                ChampionRowView(vm: vm, champ: champion)
            }
        }
        .task {
            await vm.fetchChampions()
        }
        .navigationTitle("Champions")
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ChampionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChampionListView(vm: Mock.vm)
//                .environmentObject(ViewModel())
        }
    }
}

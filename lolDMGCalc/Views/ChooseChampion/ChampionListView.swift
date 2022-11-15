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
            ForEach(vm.championList.listOfChampions) { champion in
                NavigationLink {
                    ChampionStatsOverview(vm: vm, champ: champion)
                } label: {
                    Text("\(champion.champion_name)")
                }
            }
        }
        .navigationTitle("Champions")
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ChampionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChampionListView(vm: ViewModel())
//                .environmentObject(ViewModel())
        }
    }
}

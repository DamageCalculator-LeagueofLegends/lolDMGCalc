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
            ForEach(vm.testModel.listOfChampions) { champion in
                NavigationLink {
                    ChampionStatsOverview(vm: vm)
                } label: {
                    Text("\(champion.champion_name)")
                }
            }
        }
        .searchable(text: .constant(""))
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

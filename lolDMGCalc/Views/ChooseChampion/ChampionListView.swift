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
                NavigationLink {
                    ChampionStatsOverview(vm: vm, champ: champion)
                } label: {
                    HStack {
                        AsyncImage(
                            url: URL(string: champion.champion_icon),
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                    .frame(maxWidth: 40, maxHeight: 40)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )

                        Text("\(champion.champion_name)")
                    }
                }
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

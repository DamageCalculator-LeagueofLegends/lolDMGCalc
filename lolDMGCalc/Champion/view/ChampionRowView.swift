//
//  ChampionRowView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 15.11.22.
//

import SwiftUI

struct ChampionRowView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var vm: ViewModel
    var champ: ChampionModel
    @State private var showingDetail: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    vm.selectedChampion = champ
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        AsyncImage(
                            url: URL(string: champ.champion_icon),
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                    .frame(height: 40)
                                    .cornerRadius(4)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                        Text("\(champ.champion_name)")
                            .foregroundColor(.black)
                        Spacer()
                    }
                }

                Button {
                    showingDetail.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
                .buttonStyle(.borderless)
            }
            if showingDetail {
                ChampionStatsOverview(vm: vm, champ: champ)
                    .padding(.leading, 50)
            }
        }
    }
}

struct ChampionRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ChampionRowView(vm: Mock.vm, champ: Mock.champ1)
        }
    }
}

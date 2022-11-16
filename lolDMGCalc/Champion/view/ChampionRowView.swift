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
                        AsyncImageView(url: champ.champion_icon, size: 40)
                        Text("\(champ.champion_name)")
                            .foregroundColor(Color("Black"))
                        Spacer()
                    }
                }

                Button {
                    showingDetail.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .padding([.leading, .vertical], 10)
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

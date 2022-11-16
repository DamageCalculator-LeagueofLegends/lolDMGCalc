//
//  ChooseChampionButtonView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct ChooseChampionButtonView: View {
    @ObservedObject var vm: ViewModel

    var body: some View {
        NavigationLink {
            ChampionListView(vm: vm)
        } label: {
            VStack (alignment: .leading, spacing: 3){
                Text("Champion:")
                    .foregroundColor(Color("Black"))
                if let champion = vm.selectedChampion {
                    AsyncImageView(url: champion.champion_icon, size: 90)
                } else {
                    EmptyImageView(size: 90)
                }
            }
            .buttonStyle(.borderless)
//            .navigationTitle("Dmg Calc")
        }
    }
}

struct ChooseChampionButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChooseChampionButtonView(vm: ViewModel())
        }
    }
}

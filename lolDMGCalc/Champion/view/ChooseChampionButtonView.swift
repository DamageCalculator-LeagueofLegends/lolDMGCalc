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
            VStack {
                Text("Choose Champion")
                if let champion = vm.selectedChampion {
                    AsyncImage(
                        url: URL(string: champion.champion_icon),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(maxWidth: 90, maxHeight: 90)
                                .cornerRadius(8)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                } else {
                    Rectangle()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.gray.opacity(0.4))
                        .cornerRadius(10)
                }
            }
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

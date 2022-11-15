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
                AsyncImage(
                    url: URL(string: "https://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Seraphine.png"),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaledToFit()
                            .frame(maxWidth: 90, maxHeight: 90)
                        //                            .cornerRadius(8)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
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

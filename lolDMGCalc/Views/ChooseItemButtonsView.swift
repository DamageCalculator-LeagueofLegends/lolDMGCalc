//
//  ChooseItemButtonsView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import SwiftUI

struct ChooseItemButtonsView: View {
    @ObservedObject var vm: ViewModel

    private let flexibleColoumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        Text("Choose Items:")
        LazyVGrid(columns: flexibleColoumns) {
            ForEach(1 ..< 7) { _ in
                NavigationLink {
                    ItemListView(vm: vm)
                } label: {
                    AsyncImage(
                        url: URL(string: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6653_mage_t4_liandrysanguish.png"),
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .scaledToFit()
                                .frame(maxWidth: 50, maxHeight: 50)
                                .cornerRadius(8)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                }
            }
        }
    }
}

struct ChooseItemButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChooseItemButtonsView(vm: ViewModel())
        }
    }
}

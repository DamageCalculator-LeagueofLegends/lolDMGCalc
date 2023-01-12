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
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
    ]

    var body: some View {
        VStack(spacing: 7) {
            Text("Items:")
            LazyVGrid(columns: flexibleColoumns) {
                ForEach(0 ..< 6) { i in
                    NavigationLink {
                        ItemListView(vm: vm, numberOfButton: i)
                    } label: {
                        if let item = vm.selectedItemList[i] {
                            AsyncImageView(url: item.itemIcon, size: 40)
                        } else {
                            EmptyImageView(size: 40)
                        }
                    }
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

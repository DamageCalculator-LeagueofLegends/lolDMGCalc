//
//  ItemListView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import SwiftUI

struct ItemListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: ViewModel

    var numberOfButton: Int

    var body: some View {
        List {
            ForEach(vm.itemList) { item in
                Button {
                    vm.selecteditemList[numberOfButton] = item
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        AsyncImageView(url: item.item_icon, size: 50)
                        Text(item.item_name)
                            .foregroundColor(Color("Black"))
                    }
                }
            }
        }
        .task {
            await vm.fetchIems()
        }
        .navigationTitle("Items")
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemListView(vm: Mock.vm, numberOfButton: 1)
        }
    }
}

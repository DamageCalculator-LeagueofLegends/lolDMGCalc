//
//  ItemListView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import SwiftUI

struct ItemListView: View {
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        List {
            ForEach(vm.item_list) { item in
                Text(item.item_name)
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(vm: ViewModel())
    }
}

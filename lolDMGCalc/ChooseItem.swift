//
//  ChooseItem.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 01.11.22.
//

import SwiftUI

struct ChooseItem: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        List {
            ForEach(vm.item_list) { item in
                Text(item.item_name)
            }
        }
    }
}

struct ChooseItem_Previews: PreviewProvider {
    static var previews: some View {
        ChooseItem(vm: ViewModel())
    }
}

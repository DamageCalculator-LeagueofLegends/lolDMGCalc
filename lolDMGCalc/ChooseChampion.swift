//
//  ChooseChampion.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import SwiftUI

struct ChooseChampion: View {
    @ObservedObject var vm: ViewModel
    @State var text: String = ""
    var body: some View {
        List {
            ForEach(vm.champion_list) { champion in
                Text(champion.champion_name)
            }
        }
        .searchable(text: .constant(""))
    }
}

struct ChooseChampion_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChooseChampion(vm: ViewModel())
        }
    }
}

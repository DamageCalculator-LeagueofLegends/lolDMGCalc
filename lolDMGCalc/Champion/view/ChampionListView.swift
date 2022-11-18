//
//  ChampionListView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import SwiftUI

struct ChampionListView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: ViewModel
    @State var text: String = ""

    var body: some View {
        List {
            noChampButton
            ForEach(vm.champions) { champion in
                ChampionRowView(vm: vm, champ: champion)
            }
        }
        .task {
            await vm.fetchChampions()
        }
        .navigationTitle("Champions")
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }

    var noChampButton: some View {
        Button {
            vm.selectedChampion = nil
            presentationMode.wrappedValue.dismiss()
        } label: {
            HStack {
                EmptyImageView(size: 40, clickable: false)
                Text("No Champion")
                    .foregroundColor(Color("Black"))
            }
        }
    }
}

struct ChampionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ChampionListView(vm: Mock.vm)
//                .environmentObject(ViewModel())
        }
    }
}

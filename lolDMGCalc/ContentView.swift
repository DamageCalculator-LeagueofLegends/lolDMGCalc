//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel = ViewModel()
    var body: some View {
        VStack {
            NavigationLink {
                ChooseChampion(vm: vm)
            } label: {
                Text("choose champs")
            }
            .navigationTitle("Dmg Calculator")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}

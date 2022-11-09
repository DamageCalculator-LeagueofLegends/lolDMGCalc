//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm: ViewModel = ViewModel()
    
    private let flexibleColoumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    @State private var championLevel: Double = 1
    
    @State var qLevel: Int = 0
    
    var body: some View {
        VStack {
            Text("Choose Champion")
            NavigationLink {
                ChooseChampion(vm: vm)
            } label: {
                Text("      ")
                    .foregroundColor(.white)
                    .padding(4)
                    .background(.blue)
                    .cornerRadius(8)
            }
            
            Text("Choose Items:")
            LazyVGrid(columns: flexibleColoumns) {
                ForEach(1..<7) { i in
                    NavigationLink {
                        ChooseItem(vm: vm)
                    } label: {
                        Text("Item \(i)")
                            .foregroundColor(.white)
                            .padding(7)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                }
            }
            List {
                Slider(value: $championLevel, in: 1...18, step: 1) {
                    Text("Level")
                }
                
                Text("\(Int(championLevel))")
                
                Picker(selection: $qLevel) {
                    ForEach(0..<6) { i in
                        Text("\(i)").tag(i)
                    }
                } label: {
                    Text("Qlevel")
                }
                .pickerStyle(.segmented)
                
                Text("\(qLevel)")
                Button {
                    vm.testApi()
                } label: {
                    Text("apiTest")
                }

            }
        }
        
        .navigationTitle("Dmg Calculator")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ContentView()
        }
    }
}

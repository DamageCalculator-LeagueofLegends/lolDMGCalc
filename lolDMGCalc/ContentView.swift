//
//  ContentView.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 17.10.22.
//

import SwiftUI  

struct ContentView: View {
    
    @StateObject var vm: ViewModel = ViewModel()
    var test: Image = Image(systemName: "icon")
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
                //Text("      ")
                AsyncImage(
                    url: URL(string: "https://raw.communitydragon.org/12.19/plugins/rcp-be-lol-game-data/global/default/assets/items/icons2d/6653_mage_t4_liandrysanguish.png"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 32, maxHeight: 32)
                            .cornerRadius(8)
                    },
                    placeholder:{
                        ProgressView()
                    } )
            }
            
            AsyncImage(url: URL(string: "http://ddragon.leagueoflegends.com/cdn/12.19.1/img/champion/Aatrox.png"))
            Text("Choose Items:")
            LazyVGrid(columns: flexibleColoumns) {
                ForEach(1..<7) { i in
                    NavigationLink {
                        ChooseItem(vm: vm)
                    } label: {
                        Text("Item \(i)")
                            .frame(minWidth: 64, minHeight: 64)
                            .foregroundColor(.white)
                            .padding(7)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                }
            }
            List {
                Text("Champion Level:")
                HStack{
                    Slider(value: $championLevel, in: 1...18, step: 1) {
                        Text("Level")
                    }
                    
                    Text("\(Int(championLevel))")
                }
                HStack{
                    Text("Q Level:")
                        .frame(minWidth: 65)
                    Picker(selection: $qLevel) {
                        ForEach(0..<6) { i in
                            Text("\(i)").tag(i)
                        }
                    } label: {
                        Text("Qlevel")
                    }
                    .pickerStyle(.segmented)
                }
                HStack{
                    Text("W Level:")
                        .frame(minWidth: 65)
                    Picker(selection: $qLevel) {
                        ForEach(0..<6) { i in
                            Text("\(i)").tag(i)
                        }
                    } label: {
                        Text("Qlevel")
                    }
                    .pickerStyle(.segmented)
                }
                HStack{
                    Text("E Level:")
                        .frame(minWidth: 65)
                    Picker(selection: $qLevel) {
                        ForEach(0..<6) { i in
                            Text("\(i)").tag(i)
                        }
                    } label: {
                        Text("Qlevel")
                    }
                    .pickerStyle(.segmented)
                }
                HStack{
                    Text("R Level:")
                        .frame(minWidth: 65)
                    Picker(selection: $qLevel) {
                        ForEach(0..<6) { i in
                            Text("\(i)").tag(i)
                        }
                    } label: {
                        Text("Qlevel")
                    }
                    .pickerStyle(.segmented)
                }
                //Text("\(qLevel)")
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

//
//  ChampionStatsOverview.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 15.11.22.
//

import SwiftUI

struct ChampionStatsOverview: View {
    @ObservedObject var vm: ViewModel
    var body: some View {
        List {
            
        }
    }
}

struct ChampionStatsOverview_Previews: PreviewProvider {
    static var previews: some View {
        ChampionStatsOverview(vm: ViewModel())
    }
}

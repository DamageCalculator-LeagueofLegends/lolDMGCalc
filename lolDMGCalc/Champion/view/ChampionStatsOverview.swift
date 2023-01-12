//
//  ChampionStatsOverview.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 15.11.22.
//

import SwiftUI

struct ChampionStatsOverview: View {
    @ObservedObject var vm: ViewModel
    var champ: ChampionModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Attack Damage: " + String(format: "%.0f", champ.champBasedOnLevelStats.attackDamage))
        }
    }
}

struct ChampionStatsOverview_Previews: PreviewProvider {
    static var previews: some View {
        ChampionStatsOverview(vm: ViewModel(), champ: Mock.champ1)
    }
}

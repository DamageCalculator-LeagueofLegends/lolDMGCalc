//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var champion_list: [ChampionModel] = []
    @Published var item_list: [Item] = []
    
    @Published var testModel: ChampionListModel = ChampionListModel(listOfChampions: [])
    
    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = AbilityLevel()

    private var apiClient: APIClient = .init()

    init() {
        champion_list = Mock.champions
        item_list = Mock.items

        // let champs = getChampions(for: "Ha")
    }

//    public func getChampions(for query: String) {
//        let url = "http://localhost:5000/data/\(query)"
//    }
//

    public func testApi() {
        let url = "http://127.0.0.1:5000/data"

        Task {
            
//            let model: TestModel = try await apiClient.get(url)
//            let model: ChampionListModel = try await apiClient.get(url)
            testModel = try await apiClient.get(url)
            print(testModel)
        }
    }
}

struct ChampionListModel: Codable {
    var listOfChampions: [ChampionModel]
}

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
    
    @Published var championList: ChampionListModel = ChampionListModel()
    
    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = AbilityLevel()

    @Published var error: Error?
    @Published var showingError: Bool = false
    
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

    public func testApi() async {
        let url = "http://127.0.0.1:5000/data"

//            let model: TestModel = try await apiClient.get(url)
//            let model: ChampionListModel = try await apiClient.get(url)
        do {
            let championList: ChampionListModel = try await apiClient.get(url)
            await MainActor.run {
                self.championList = championList
            }
        } catch {
            print(error)
            await MainActor.run {
                self.error = error
                self.showingError = true
            }
        }
    }
}

struct ChampionListModel: Codable {
    var listOfChampions: [ChampionModel] = []
}

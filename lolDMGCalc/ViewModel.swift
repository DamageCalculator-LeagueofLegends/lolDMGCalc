//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var championList: [ChampionModel] = []
    @Published var item_list: [Item] = []

    @Published var hasChampionChosen: Bool = false

    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = .init()

    @Published var error: Error?
    @Published var showingError: Bool = false

    private var apiClient: APIClient = .init()
    private var championService: ChampionServiceProtocol

    init(championService: ChampionServiceProtocol = ChampionService()) {
        item_list = Mock.items
        self.championService = championService
    }

    public func fetchChampions() async {
        do {
            let champions: [ChampionModel] = try await championService.getChampions()
            await MainActor.run {
                self.championList = champions
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

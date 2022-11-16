//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var championList: [ChampionModel] = []
    @Published var itemList: [ItemModel] = []

    @Published var selectedChampion: ChampionModel? = nil
    
    @Published var selectedItemOne: ItemModel? = nil
    @Published var selectedItemTwo: ItemModel? = nil
    @Published var selectedItemThree: ItemModel? = nil
    @Published var selectedItemFour: ItemModel? = nil
    @Published var selectedItemFive: ItemModel? = nil
    @Published var selectedItemSix: ItemModel? = nil

    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = .init()

    @Published var error: Error?
    @Published var showingError: Bool = false

    private var apiClient: APIClient = .init()
    private var championService: ChampionServiceProtocol
    private var itemService: ItemServiceProtocol

    init(championService: ChampionServiceProtocol = ChampionService(), itemService: ItemServiceProtocol = ItemService()) {
        self.itemService = itemService
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
    
    public func fetchIems() async {
        do {
            let allItems: [ItemModel] = try await itemService.getItems()
            await MainActor.run {
                self.itemList = allItems
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

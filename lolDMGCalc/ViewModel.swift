//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var champions: [ChampionModel] = []
    @Published var selectedChampion: ChampionModel? = nil
    
    @Published var items: [ItemModel] = []
    @Published var selectedItemList: [ItemModel?] = [nil, nil, nil, nil, nil, nil]
    
    @Published var selectedActions: [Action] = []
    
    @Published var dummy: Dummy = Dummy(health: 1000, armor: 0, magicResistance: 0)

    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = .init()
    
    @Published var error: Error?
    @Published var showingError: Bool = false
    
    @Published var output: OutputModel = OutputModel(totalDamage: 0, trueDamage: 1, physicalDamage: 2, magicDamage: 3)

    private var apiClient: APIClient = .init()
    private var championService: ChampionServiceProtocol
    private var itemService: ItemServiceProtocol
    
    var selectableAbilities: [Action] {
        var tempArray: [Action] = [ActionData.autoAttack]
        for ability in ActionData.abilities {
            if abilityLevel.isAvaliable(ability.name) {
                tempArray.append(ability)
            }
        }
        
        return tempArray
    }
    var selectableAcitveItems: [Action] {
        var tempArray: [Action] = []
        for itemIndex in selectedItemList.indices {
            let item = selectedItemList[itemIndex]
            if item?.has_active ?? false {
                tempArray.append(ActionData.items[itemIndex])
            }
        }
        return tempArray
    }

    init(championService: ChampionServiceProtocol = ChampionService(), itemService: ItemServiceProtocol = ItemService()) {
        self.itemService = itemService
        self.championService = championService
    }

    public func fetchChampions() async {
        do {
            let champions: [ChampionModel] = try await championService.getChampions()
            await MainActor.run {
                self.champions = champions
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
                self.items = allItems
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

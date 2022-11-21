//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var champions: [ChampionModel] = []
    @Published var selectedChampion: ChampionModel?

    @Published var items: [ItemModel] = []
    @Published var selectedItemList: [ItemModel?] = [nil, nil, nil, nil, nil, nil]

    @Published var selectedActions: [Action] = []

    @Published var dummy: Dummy = .init(health: 1000, armor: 0, magicResistance: 0)

    @Published var championLevel: Double = 1
    @Published var abilityLevel: AbilityLevel = .init()

    @Published var error: Error?
    @Published var showingError: Bool = false

    @Published var output: OutputModel = .init(totalDamage: 0, trueDamage: 1, physicalDamage: 2, magicDamage: 3)

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

    init(championService: ChampionServiceProtocol = ChampionService(), itemService: ItemServiceProtocol = ItemService(), selectedChampion: ChampionModel? = nil) {
        self.itemService = itemService
        self.championService = championService
        self.selectedChampion = selectedChampion
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

    public func newLevel(_ newValue: Int, description: String) {
        selectedActions = selectedActions.filter { $0.name != description }
        abilityLevel.newValue(newValue, for: description)
    }

    public func sendData() {
//        var json_encoder = JSONEncoder()
        let dataSet = BackendData(
            championID: selectedChampion?.champion_id ?? 0,
            listOfItemIDs: selectedItemList.map { $0?.item_id ?? 0 },
            listOfActionNames: selectedActions.map { $0.name },
            championLevel: Int(championLevel),
            abilityLevel: abilityLevel.levels.map { $0.value },
            dummyStats: [dummy.health, dummy.armor, dummy.magicResistance]
        )
        Task{
            do {
                guard let url = URL(string: "http://127.0.0.1:5000/sendData") else {throw URLError(.badURL)}
                let data: BackendData = try await apiClient.post(url, payload: dataSet)
                print(data)
            } catch {
                print(error)
            }
        }
        
//        do {
//            let encoded_data = try json_encoder.encode(dataSet)
//            print(String(data: encoded_data, encoding: .utf8)!)
//        } catch {
//            print("eroor")
//        }
        
    }
}

struct BackendData: Codable {
    var championID: Int
    var listOfItemIDs: [Int?]
    var listOfActionNames: [String]
    var championLevel: Int
    var abilityLevel: [Int]
    var dummyStats: [Int]
}

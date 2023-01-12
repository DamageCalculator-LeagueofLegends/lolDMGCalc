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
            if item?.hasActive ?? false {
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
        let dataSet = FrontendData(
            participants: [
                Participant(
                    type:selectedChampion?.tpye ?? "",
                    championID: selectedChampion?.champID,
                    championLevel: Int(championLevel),
                    listOfItemIDs: selectedItemList.map { $0?.itemID ?? 0},
                    listOfActions: Mock.actionConditionsList,
                    abilityLevel: Ability(
                        q: abilityLevel.levels[0].value,
                        w: abilityLevel.levels[1].value,
                        e: abilityLevel.levels[2].value,
                        r: abilityLevel.levels[3].value
                    )
                ),
                Participant(
                    type: "DUMMY",
                    health: dummy.health,
                    armor: dummy.armor,
                    magicResistance: dummy.magicResistance
                )
            ]
        )
        Task{
            do {
                guard let url = URL(string: "http://127.0.0.1:3000/sendData") else {throw URLError(.badURL)}
                let data: OverallDamageData = try await apiClient.post(url, payload: dataSet)
                print(data)
                output.totalDamage = data.totalDamge
                output.trueDamage = data.trueDamage
                output.physicalDamage = data.physicalDamage
                output.magicDamage = data.magicDamage
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


// MARK: - FrontendData
struct FrontendData: Codable {
    let participants: [Participant]


}

// MARK: - Participant
struct Participant: Codable {
    let type: String
    var championID, championLevel: Int?
    var listOfItemIDs: [Int]?
    var listOfActions: [ActionAndCondition]?
    var abilityLevel: Ability?
    var health, armor, magicResistance: Int?

    init(type: String, championID: Int?, championLevel: Int?, listOfItemIDs: [Int]?, listOfActions: [ActionAndCondition]?, abilityLevel: Ability?) {
        self.type = type
        self.championID = championID
        self.championLevel = championLevel
        self.listOfItemIDs = listOfItemIDs
        self.listOfActions = listOfActions
        self.abilityLevel = abilityLevel
    }

    init( type: String, health: Int?, armor: Int?, magicResistance: Int?) {
        self.type = type
        self.health = health
        self.armor = armor
        self.magicResistance = magicResistance
    }
}

// MARK: - AbilityLevel
struct Ability: Codable {
    let q, w, e, r: Int

    enum CodingKeys: String, CodingKey {
        case q = "Q"
        case w = "W"
        case e = "E"
        case r = "R"
    }
}

// MARK: - ListOfAction
struct ActionAndCondition: Codable {
    let ability: String
    let conditions: ActionConditions?
}

struct OverallDamageData: Codable {
    let totalDamge: Double;
    let trueDamage: Double;
    let physicalDamage: Double;
    let magicDamage: Double;
    let abilityDamage: [AbilityDamage]
}


struct AbilityDamage: Codable {
    let type: String
    let value: Double
}

//
//  ChampionService.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 15.11.22.
//

import Foundation

// MARK: Protocol --------------------------------------

protocol ChampionServiceProtocol {
    func getChampions() async throws -> [ChampionModel]
}

// MARK: Service --------------------------------------

class ChampionService: ChampionServiceProtocol {
    private let client: APIClient = .init()
    let url = "http://127.0.0.1:3000/getInitData/champs"

    func getChampions() async throws -> [ChampionModel] {
        let data: ChampionListModel = try await client.get(url)
        return data.listOfChampions
    }
}

// MARK: Mock Service -----------------------------------

class ChampionServiceMock: ChampionServiceProtocol {
    func getChampions() async throws -> [ChampionModel] {
        return Mock.champions
    }
}

struct ChampionListModel: Codable {
    var listOfChampions: [ChampionModel] = []
}

//
//  ItemService.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 16.11.22.
//

import Foundation

// MARK: Protocol --------------------------------------

protocol ItemServiceProtocol {
    func getItems() async throws -> [ItemModel]
}

// MARK: Service --------------------------------------

class ItemService: ItemServiceProtocol {
    private let client: APIClient = .init()
    let url = "http://127.0.0.1:5000/getInitItems"

    func getItems() async throws -> [ItemModel] {
        let data: ItemListModel = try await client.get(url)
        return data.listOfItems
    }
}

// MARK: Mock Service -----------------------------------

class ItemServiceMock: ItemServiceProtocol {
    func getItems() async throws -> [ItemModel] {
        return Mock.items
    }
}

struct ItemListModel: Codable {
    var listOfItems: [ItemModel] = []
}

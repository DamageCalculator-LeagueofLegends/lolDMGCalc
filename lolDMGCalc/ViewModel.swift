//
//  ViewModel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 29.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var champion_list: [Champion] = []
    @Published var item_list: [Item] = []
    
    private var apiClient: APIClient = APIClient()

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
            let model: TestModel = try await apiClient.get(url)
            print(model)
        }
    }
}

struct TestModel: Codable {
    let names: [String]
    
}

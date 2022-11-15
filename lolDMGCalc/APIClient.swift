//
//  APIClient.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 09.11.22.
//

import Foundation

class APIClient {
    private let urlSession: URLSession = .shared

    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    public func get<Res: Codable>(_ urlString: String) async throws -> Res {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let reqeust = URLRequest(url: url)

        return try await performRequest(reqeust)
    }

    public func post<Req: Codable, Res: Codable>(_ url: URL, payload: Req) async throws -> Res {
        return try await write(url, payload: payload, method: "POST")
    }

    public func update<Req: Codable, Res: Codable>(_ url: URL, payload: Req) async throws -> Res {
        return try await write(url, payload: payload, method: "PATCH")
    }

    private func write<Req: Codable, Res: Codable>(_ url: URL, payload: Req, method: String) async throws -> Res {
        var request = URLRequest(url: url)

        let json = try encoder.encode(payload)
        request.httpBody = json

        request.httpMethod = method

        return try await performRequest(request)
    }

    private func performRequest<Res: Codable>(_ request: URLRequest) async throws -> Res {
        let (data, response) = try await urlSession.data(for: request)

//        print(data)
//        print(response)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        if httpResponse.statusCode == 404 {
            throw URLError(.cannotFindHost)
        }
        if httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }

        do {
            return try decoder.decode(Res.self, from: data)
        } catch {
            throw error
        }
    }
}

//
//  APIService.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//

import Foundation

class APIService {
    static let shared = APIService()

    func fetchAmiibos(_ endpoint: EndpointApi) async throws -> [Amiibo] {
        guard let url = endpoint.url else { return [] }
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(AmiiboResponse.self, from: data)
        return response.amiibo
    }
}

struct AmiiboResponse: Codable {
    let amiibo: [Amiibo]
}

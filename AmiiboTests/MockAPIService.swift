//
//  MockAPIService.swift
//  AmiiboTests
//
//  Created by tommy yohanes on 20/08/24.
//

import Foundation
@testable import Amiibo

class MockAPIService: APIService {
    var shouldFail: Bool

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    override func fetchAmiibos() async throws -> [Amiibo] {
        if shouldFail {
            throw URLError(.badServerResponse)
        }
        return [Amiibo(name: "Mario", character: "Mario", image: "https://example.com/mario.png", amiiboSeries: "Super Mario")]
    }
}

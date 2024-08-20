//
//  PersistenceController.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//

import SwiftData

@MainActor
class PersistenceController {
    static let shared = PersistenceController()

    func saveAmiibos(_ amiibos: [Amiibo]) {
        // Save amiibos to the database
    }

    func loadAmiibos() -> [Amiibo]? {
        // Load amiibos from the database
        return nil
    }
}

//
//  Amiibo.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//
import Foundation
import SwiftData

struct Amiibo: Codable, Identifiable {
    var id: String { name }
    let name: String
    let character: String
    let image: String
    let amiiboSeries: String
    
    init(name: String, character: String, image: String, amiiboSeries: String) {
        self.name = name
        self.character = character
        self.image = image
        self.amiiboSeries = amiiboSeries
    }
}

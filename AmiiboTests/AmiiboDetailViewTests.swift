//
//  File.swift
//  AmiiboTests
//
//  Created by tommy yohanes on 20/08/24.
//
import XCTest
import SwiftUI
@testable import Amiibo

final class AmiiboDetailViewTests: XCTestCase {

    func testAmiiboDetailView() {
        let amiibo = Amiibo(
            name: "Mario",
            character: "Mario",
            image: "https://example.com/mario.png",
            amiiboSeries: "Super Mario"
        )
        let detailView = AmiiboDetailView(amiibo: amiibo)

        // Use the SwiftUI Previews to inspect the detail view UI
        let _ = UIHostingController(rootView: detailView)
    }
}

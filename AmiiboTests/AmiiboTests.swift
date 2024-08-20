//
//  AmiiboTests.swift
//  AmiiboTests
//
//  Created by tommy yohanes on 20/08/24.
//
import XCTest
@testable import Amiibo

@MainActor
final class AmiiboTests: XCTestCase {
    var viewModel: AmiiboListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = AmiiboListViewModel()
        viewModel.amiibos = [
            Amiibo(name: "Mario", character: "Mario", image: "https://example.com/mario.png", amiiboSeries: "Super Mario"),
            Amiibo(name: "Link", character: "Link", image: "https://example.com/link.png", amiiboSeries: "Zelda")
        ]
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testSearchAmiibos() {
        viewModel.searchText = "Mario"
        XCTAssertEqual(viewModel.filteredAmiibos.count, 1)
        XCTAssertEqual(viewModel.filteredAmiibos.first?.name, "Mario")

        viewModel.searchText = "Link"
        XCTAssertEqual(viewModel.filteredAmiibos.count, 1)
        XCTAssertEqual(viewModel.filteredAmiibos.first?.name, "Link")

        viewModel.searchText = ""
        XCTAssertEqual(viewModel.filteredAmiibos.count, 2) // All items should be visible
    }
}

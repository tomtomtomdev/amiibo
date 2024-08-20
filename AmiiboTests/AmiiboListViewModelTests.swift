//
//  File.swift
//  AmiiboTests
//
//  Created by tommy yohanes on 20/08/24.
//
import XCTest
@testable import Amiibo

@MainActor
final class AmiiboListViewModelTests: XCTestCase {
    var viewModel: AmiiboListViewModel!

    override func setUp() {
        super.setUp()
        viewModel = AmiiboListViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testFetchAmiibosSuccess() async {
        await viewModel.fetchAmiibos()
        XCTAssertFalse(viewModel.amiibos.isEmpty)
    }

    func testFetchAmiibosFailure() async {
        APIService.shared = MockAPIService(shouldFail: true)
        await viewModel.fetchAmiibos()
        XCTAssertNotNil(viewModel.errorMessage)
    }
}

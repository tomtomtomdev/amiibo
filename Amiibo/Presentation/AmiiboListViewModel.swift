//
//  AmiiboListViewModel.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//

import Foundation
import Combine

@MainActor
class AmiiboListViewModel: ObservableObject {
    @Published var amiibos: [Amiibo] = []
    @Published var filteredAmiibos: [Amiibo] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var searchText: String = "" {
        didSet {
            filterAmiibos()
        }
    }

    func fetchAmiibos() async {
        isLoading = true
        do {
            amiibos = try await APIService.shared.fetchAmiibos(.name(""))
            filteredAmiibos = amiibos
        } catch {
            errorMessage = "Failed to load Amiibos: \(error.localizedDescription)"
        }
        isLoading = false
    }

    private func filterAmiibos() {
        if searchText.isEmpty {
            filteredAmiibos = amiibos
        } else {
            filteredAmiibos = amiibos.filter { amiibo in
                amiibo.name.lowercased().contains(searchText.lowercased()) ||
                amiibo.character.lowercased().contains(searchText.lowercased()) ||
                amiibo.amiiboSeries.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

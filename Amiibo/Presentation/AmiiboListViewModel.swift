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
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchAmiibos() async {
        isLoading = true
        do {
            amiibos = try await APIService.shared.fetchAmiibos(.name(""))
        } catch {
            errorMessage = "Failed to load Amiibos: \(error.localizedDescription)"
        }
        isLoading = false
    }
}

//
//  AmiiboListView.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//
import SwiftUI

struct AmiiboListView: View {
    @StateObject private var viewModel = AmiiboListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.amiibos) { amiibo in
                NavigationLink(destination: AmiiboDetailView(amiibo: amiibo)) {
                    HStack {
                        AsyncImage(url: URL(string: amiibo.image)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text(amiibo.name)
                                .font(.headline)
                            Text(amiibo.character)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Amiibos")
            .task {
                await viewModel.fetchAmiibos()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                }
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

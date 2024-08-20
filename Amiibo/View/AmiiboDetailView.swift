//
//  AmiiboDetailView.swift
//  Amiibo
//
//  Created by tommy yohanes on 20/08/24.
//

import SwiftUI

struct AmiiboDetailView: View {
    let amiibo: Amiibo

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            AsyncImage(url: URL(string: amiibo.image)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 150)

            Text(amiibo.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Character: \(amiibo.character)")
                .font(.title2)

            Text("Series: \(amiibo.amiiboSeries)")
                .font(.title3)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle(amiibo.name)
    }
}

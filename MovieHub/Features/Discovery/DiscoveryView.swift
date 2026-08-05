//
//  DiscoveryView.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import SwiftUI

struct DiscoveryView: View {
    @State private var store: DiscoveryStore
    
    init(store: DiscoveryStore) {
        self.store = store
    }
    
    var body: some View {
        NavigationStack {
            content.navigationTitle("Films populaires")
        }
        .task {
            await store.loadMovies()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch store.state {
        case .idle, .loading:
            ProgressView("Chargement...")
            
        case let .loaded(movies):
            List(movies) { movie in
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .font(.headline)
                    
                    if let releaseDate = movie.releaseDate {
                        Text(releaseDate, format: .dateTime.year())
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
                
            }
        case let .failed(message):
            ContentUnavailableView{
                Label("Chargement impossible", systemImage: "exclamationmark.triangle")
            } description: {
                Text(message)
            } actions: {
                Button("Réessayer") {
                    Task {
                        await store.loadMovies()
                    }
                }
            }
        }
    }
}

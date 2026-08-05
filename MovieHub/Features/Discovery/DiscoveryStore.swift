//
//  DiscoveryStore.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import Foundation
import Observation

enum DiscoveryState: Equatable {
    case idle
    case loading
    case loaded([Movie])
    case failed(message: String)
}

@MainActor
@Observable
final class DiscoveryStore {
    private(set) var state: DiscoveryState = .idle

    private let repository: any MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func loadMovies() async {
        guard state != .loading else { return }
        
        state = .loading
        
        do {
            let movies = try await repository.popularMovies(page: 1)
            state = .loaded(movies)
        } catch {
            print("Discovery loading error:", error)

            state = .failed(message: "Impossible de charger les films.")
        }
    }
}

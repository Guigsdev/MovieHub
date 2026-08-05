//
//  AppDependencies.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import Foundation

@MainActor
final class AppDependencies {
    private let movieRepository: any MovieRepository
    
    init(tmdbToken: String,
         session: URLSession = .shared) {
        let client = TMDBClient(session: session, token: tmdbToken)
        self.movieRepository = TMDBMovieRepository(client: client)
    }
    
    func makeDiscoveryStore() -> DiscoveryStore {
        DiscoveryStore(repository: movieRepository)
    }
}

//
//  TMDBMovieRepository.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import Foundation

struct TMDBMovieRepository: MovieRepository {
    private let client: TMDBClient
    
    init(client: TMDBClient) {
        self.client = client
    }
    
    func popularMovies(page: Int) async throws -> [Movie] {
        let response: PopularMoviesResponseDTO = try await client.request(.popularMovies(page: page))
        return response.results.map { $0.toDomain() }
    }
}

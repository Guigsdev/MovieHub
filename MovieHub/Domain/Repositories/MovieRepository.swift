//
//  MovieRepository.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import Foundation

protocol MovieRepository: Sendable {
    func popularMovies(page: Int) async throws -> [Movie]
}


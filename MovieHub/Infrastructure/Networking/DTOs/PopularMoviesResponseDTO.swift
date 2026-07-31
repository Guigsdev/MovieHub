//
//  PopularMoviesResponseDTO.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 31/07/2026.
//

struct PopularMoviesResponseDTO: Decodable {
    let page: Int
    let results: [MovieDTO]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

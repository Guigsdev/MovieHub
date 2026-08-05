//
//  TMDBEndpoint.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 02/08/2026.
//

import Foundation

enum TMDBEndpoint {
    case popularMovies(page: Int)
}

extension TMDBEndpoint {
    var path: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case let .popularMovies(page):
            [
                URLQueryItem(name: "page", value: String(page))
            ]
        }
    }
    
    var url: URL? {
        guard var components = URLComponents(url: TMDBConfiguration.apiBaseURL, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        components.path += path
        components.queryItems = queryItems
        
        return components.url
    }
}

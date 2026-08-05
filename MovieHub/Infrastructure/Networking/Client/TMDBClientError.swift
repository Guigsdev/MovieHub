//
//  TMDBClientError.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 02/08/2026.
//

import Foundation

enum TMDBClientError: Error {
    case invalidURL
    case invalidResponse
    case httpError(statusCode: Int)
    case decodingFailed(Error)
}

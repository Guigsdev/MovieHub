//
//  Movie.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 31/07/2026.
//

import Foundation

struct Movie: Identifiable, Equatable, Sendable {
    let id: Int
    let title: String
    let releaseDate: Date?
    let posterURL: URL?
    let rating: Double?
}

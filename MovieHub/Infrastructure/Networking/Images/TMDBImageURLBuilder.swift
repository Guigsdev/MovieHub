//
//  TMDBImageURLBuilder.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 31/07/2026.
//

import Foundation

enum TMDBImageURLBuilder {
    static func posterURL(from path: String?) -> URL? {
        guard let path, !path.isEmpty else {
            return nil
        }
        return TMDBConfiguration.posterbaseURL.appending(path: path)
    }
}

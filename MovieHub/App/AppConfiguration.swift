//
//  AppConfiguration.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 05/08/2026.
//

import Foundation

enum AppConfiguration {
    static var tmdbToken: String {
        guard
            let token = Bundle.main.object(
                forInfoDictionaryKey: "TMDBToken"
            ) as? String,
            !token.isEmpty,
            token != "$(TMDB_TOKEN)"
        else {
            preconditionFailure(
                "TMDB_TOKEN is missing. Configure Secrets.xcconfig."
            )
        }

        return token
    }
}

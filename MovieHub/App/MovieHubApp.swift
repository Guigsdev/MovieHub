//
//  MovieHubApp.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 29/07/2026.
//

import SwiftUI

@main
struct MovieHubApp: App {
    private let dependencies: AppDependencies
    
    init() {
        dependencies = AppDependencies(tmdbToken: AppConfiguration.tmdbToken)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(dependencies: dependencies)
        }
    }
}

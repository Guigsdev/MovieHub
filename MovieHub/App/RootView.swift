//
//  ContentView.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 29/07/2026.
//

import SwiftUI

struct RootView: View {
    @State private var discoveryStore: DiscoveryStore
    
    init(dependencies: AppDependencies) {
        _discoveryStore = State(initialValue: dependencies.makeDiscoveryStore())
    }
    
    var body: some View {
        DiscoveryView(store: discoveryStore)
    }
}

/*#Preview {
    RootView()
}*/

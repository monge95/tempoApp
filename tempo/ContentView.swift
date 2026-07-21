//
//  ContentView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 15/07/26.
//

import SwiftUI

enum AppTab: String, CaseIterable, Identifiable {
    case timeline, dias, mapa
    var id: Self { self }
}

struct ContentView: View {
    @State private var selectedTab: AppTab = .timeline

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Timeline", systemImage: "clock", value: .timeline) {
                TimilileView()
            }

            Tab("Dias", systemImage: "calendar", value: .dias) {
        
            }

            Tab("Mapa", systemImage: "map", value: .mapa) {
                MapaView(selectedTab: $selectedTab)
                     .toolbar(.hidden, for: .tabBar)
            }
        }
    }
}
#Preview {
    ContentView()
}

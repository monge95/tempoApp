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
    @State private var tabOrigem: AppTab = .timeline   // ← guarda de onde veio

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Timeline", systemImage: "clock", value: .timeline) {
                TimiLineView()
            }

            Tab("Dias", systemImage: "calendar", value: .dias) {
                ProximosDias()
            }

            Tab("Mapa", systemImage: "map", value: .mapa) {
                MapaView(selectedTab: $selectedTab, tabOrigem: tabOrigem)
                    .toolbar(.hidden, for: .tabBar)
            }
           
        }
        .onChange(of: selectedTab) { oldTab, newTab in
        
            if newTab == .mapa {
                tabOrigem = oldTab
            }
        }
    }
}
#Preview {
    ContentView()
}

//
//  mapView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//

import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct MapaView: View {
    @Binding var selectedTab: AppTab
    @State private var viewModel = MapaViewModel()

    var body: some View {
        NavigationStack {
            Map(position: $viewModel.posicaoCamera) {
                UserAnnotation()
            }
            .mapStyle(.standard(elevation: .realistic))
            .mapControls {
                MapCompass()
                MapScaleView()
                MapUserLocationButton()  // ← nativo
            }
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation { selectedTab = .timeline    }
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .black.opacity(0.35))
                    }
                }
            }
            .toolbarBackground(.hidden, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapaView(selectedTab: .constant(.timeline))
}

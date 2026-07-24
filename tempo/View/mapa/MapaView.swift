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
    var tabOrigem: AppTab          // ← recebe a tab de origem
    @State private var viewModel = MapaViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $viewModel.posicaoCamera) {
                    UserAnnotation()
                }
                .mapStyle(.standard)
                .mapControls {
                    MapCompass()
                    MapScaleView()
                }
                .toolbarBackground(.hidden, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)

                OverlayTemperatura()

                Image("legendaDeCalor")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .allowsHitTesting(false)

                // Botão X
                VStack {
                    HStack {
                        Button {
                            selectedTab = tabOrigem  // ← volta pra tab de origem
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 34, height: 34)
                        }
                        .glassEffect(.regular.tint(.black.opacity(0.3)))

                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                    Spacer()
                }
            }
        }
    }
}
#Preview {
    MapaView(selectedTab: .constant(.mapa), tabOrigem: .timeline)
}

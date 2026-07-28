//
//  mapView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//

import SwiftUI
import MapKit

struct MapaView: View {
    @Binding var selectedTab: AppTab
    var tabOrigem: AppTab
    @State private var viewModel = MapaViewModel()
    @State private var hora = 2.0
    @State private var overlayAtivo: OverlayType = .temperatura

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

                switch overlayAtivo {
                case .temperatura:
                    OverlayTemperatura()
                case .ventos:
                    OverlayVentos()
                case .nenhum:
                    EmptyView()
                }

                VStack {
                    HStack {
                        Button {
                            selectedTab = tabOrigem
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                        }
                        .glassEffect(.regular.tint(.black.opacity(0.3)))

                        Spacer()

                       
                     

                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                    Spacer()

                    VStack {
                        HStack {
                            Text("")
                            Spacer()
                            Spacer()
                            Text("agora")
                            Spacer()
                            Text("1h")
                            Spacer()
                            Text("2h")
                            Spacer()
                            Text("3h")
                        }
                        .foregroundStyle(.black)
                        .padding(.horizontal, 10)

                        HStack(spacing: 15) {
                            Image(systemName: "play.fill")
                                .foregroundStyle(.black)
                                .font(.system(size: 20, weight: .bold))

                            Slider(value: $hora, in: 1...5, step: 1)
                                .tint(.blue)
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

#Preview {
    MapaView(selectedTab: .constant(.mapa), tabOrigem: .timeline)
}

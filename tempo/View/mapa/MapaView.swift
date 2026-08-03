//
//  mapView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//

import SwiftUI
import MapKit

// Controla qual card está aberto — só um por vez
enum CardAtivo: Equatable {
    case nenhum
    case seletor
    case segundo
}

struct MapaView: View {
    @Binding var selectedTab: AppTab
    var tabOrigem: AppTab
    @State private var viewModel = MapaViewModel()
    @State private var hora = 2.0
    @State private var overlayAtivo: OverlayType = .temperatura
    @State private var cardAtivo: CardAtivo = .nenhum

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
                case .precipitacao:
                    OverlayPrecipitacao()
                case .ventos:
                    OverlayVentos()
                }


                if cardAtivo != .nenhum {
                    Color.clear
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                cardAtivo = .nenhum
                            }
                        }
                        .ignoresSafeArea()
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

 
                        HStack(spacing: 8) {

                            if cardAtivo == .seletor {
                                SeletorOverlay(
                                    overlayAtivo: $overlayAtivo
                                ) {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        cardAtivo = .nenhum
                                    }
                                }
                                .frame(width: 170)
                                .transition(
                                    .move(edge: .trailing)
                                    .combined(with: .opacity)
                                )
                            }

                            if cardAtivo == .segundo {
                                SeletorLocalMap {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        cardAtivo = .nenhum
                                    }
                                }
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                            }

                            VStack(spacing: 2) {
                                Button {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        cardAtivo = (
                                            cardAtivo == .seletor
                                            ? .nenhum
                                            : .seletor
                                        )
                                    }
                                } label: {
                                    Image(systemName: "square.stack.3d.up.fill")
                                        .font(.system(size: 24, weight: .medium))
                                        .foregroundStyle(.black)
                                        .frame(width: 44, height: 44)
                                }

                                Button {
                                    withAnimation(.easeInOut(duration: 0.25)) {
                                        cardAtivo = (
                                            cardAtivo == .segundo
                                            ? .nenhum
                                            : .segundo
                                        )
                                    }
                                } label: {
                                    Image(systemName: "list.bullet")
                                        .font(.system(size: 24, weight: .medium))
                                        .foregroundStyle(.black)
                                        .frame(width: 44, height: 44)
                                }
                            }
                            .padding(5)
                            .background(Color.white)
                            
                            .clipShape(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                            )
                        }
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
            } .onAppear {
                viewModel.solicitarPermissao()
            }
            }
    }
}

#Preview {
    MapaView(selectedTab: .constant(.mapa), tabOrigem: .timeline)
}

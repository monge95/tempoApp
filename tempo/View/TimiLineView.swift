//
//  TimilileView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//
import SwiftUI

struct TimiLineView: View {
    
    @State private var showPopover = false
  
    
    enum TelaDetalhes {
        case clima
        case sol
    }

    @State private var telaAtual: TelaDetalhes = .clima
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("fundo")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    ZStack {
                        // Localizaçao
                        HStack {
                            NavigationLink {
                                BuscarLocalizacao()
                            } label: {
                                Image(systemName: "mappin.and.ellipse.circle.fill")
                                    .font(.system(size: geo.size.width / 9))
                                    .foregroundStyle(.white)
                            }
                            .padding(.leading)
                            Spacer()
                        }
                        
                        
                        Text("Próximos dias")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        // sino
                        HStack {
                            Spacer()
                            SinoButton()
                                .padding(.trailing)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, geo.size.height / 20)
                    

                    ScrollView {
                        NavigationLink {
                            SunPositionView(selectedTab: .constant(.timeline))
                        } label: {
                            Image("timeline")
                                .padding(.horizontal, geo.size.width / 15)
                                .padding(.bottom, geo.size.height / 5)
                        }
                        
                    }
                    .padding(.top, geo.size.height / 7)
                    
                    
                    // pop pap
                    if showPopover {
                        ZStack {
                            Color.black.opacity(0.3)
                                .ignoresSafeArea()
                                .onTapGesture {
                                    showPopover = false
                                }

                            VStack(spacing: 16) {
                                HStack {
                                    Text("Timeline")
                                        .font(.custom("sfpro-semibold", size: 18, relativeTo: .headline))

                                    Spacer()

                                    Button {
                                        withAnimation(.easeInOut(duration: 0.25)) {
                                            showPopover = false
                                        }
                                    } label: {
                                        Image(systemName: "xmark")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundStyle(.gray)
                                            .padding(8)
                                            .background(Color.gray.opacity(0.15))
                                            .clipShape(Circle())
                                    }
                                }

                                HStack(spacing: 8) {
                                    Image(systemName: "cloud.heavyrain.fill")
                                        .font(.system(size: 28))
                                        .foregroundStyle(.blue)

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Chuva forte")
                                            .font(.custom("sfpro-semibold", size: 16))
                                            .foregroundStyle(.primary)

                                        Text("Há previsão de chuva intensa na sua região a partir das 17:00.")
                                            .font(.system(size: 13))
                                            .foregroundStyle(.secondary)
                                            .multilineTextAlignment(.leading)
                                    }
                                    Spacer()
                                }

                                Button {
                                    // ação do "ver no mapa"
                                } label: {
                                    Text("Ver no mapa")
                                        .font(.custom("sfpro-semibold", size: 15))
                                        .foregroundStyle(.white)
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                        .background(Color.blue)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                            .padding(20)
                            .background(.regularMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
                            .padding(.horizontal, 40)
                        }
                        .transition(.opacity.combined(with: .scale(scale: 0.95)))
                    }
                }
                .ignoresSafeArea(.all, edges: .top)// ignora só o topo
                
            }
            .navigationBarHidden(true) // força remover o espaço
            .toolbar(.hidden, for: .navigationBar)
            
        }
    }
}

#Preview {
    TimiLineView()
}

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
    @State private var minhaData = Date()

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
                        
                        
                        Text("timeline")
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
                    .padding(.top, geo.size.height / 15)
                    Spacer()
                    
                    
                 
                    
                   ScrollView {
                        NavigationLink {
                            SunPositionView(selectedTab: .constant(.timeline))
                        } label: {
                            Image("timeline")
                                .padding(.bottom, geo.size.height / 5)
                        }
                        
                    }
                   .padding(.top, geo.size.height / 3.8)
                
                    Seletor()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .padding(.top, geo.size.height * 0.15)
                    Text("Hoje, \(minhaData.formatted(.dateTime.day()) + " de " + minhaData.formatted(.dateTime.month()))")
                        .font(Font.system(.title3, design: .rounded))
                        .foregroundStyle(Color.white.opacity(0.8))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .padding(.top, geo.size.height * 0.19)
                        
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

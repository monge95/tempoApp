//
//  BuscarLocalizacao.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 26/07/26.
//

import SwiftUI

struct BuscarLocalizacao: View {
    @Environment(\.dismiss) private var dismiss
    @State private var textoBusca = ""
    @State private var cidades: [ComponenteLocalizacao] = ComponenteLocalizacao.Mock


    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("fundo")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    ZStack {
                        
                        Button {
                            dismiss()
                        } label: {
                            Circle()
                                .fill(.white.opacity(0.8))
                                .frame(width: 44, height: 44)
                                .overlay {
                                    Image(systemName: "chevron.left")
                                        .font(.system(size: 17, weight: .semibold))
                                        .foregroundStyle(.blue)
                                }
                                .padding(.leading)

                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("timeline")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundStyle(.white)
                        
                    
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .padding(.top, geo.size.height * 0)
                    
                    ListaLocalizacoes(cidades: $cidades)
                        .padding(.top, geo.size.height / 8)
                        
                   
                 
                      

                    
                    
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)  
        .toolbar(.hidden, for: .tabBar)
        
        .safeAreaInset(edge: .bottom) {
                  BarraBusca(textoBusca: $textoBusca, cidades: $cidades)
                      .padding(.horizontal)
                      .padding(.bottom, 8)
              }
    }
}
#Preview {
    BuscarLocalizacao()
}

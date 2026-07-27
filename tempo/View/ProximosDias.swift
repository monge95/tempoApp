//
//  constant.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 22/07/26.
//

import SwiftUI

struct ProximosDias : View {
    @State private var showPopover = false
    
    var body: some View {
        
        GeometryReader { geo in
            NavigationStack {
                
                
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
                    Spacer()
                    
                    
                }
            }
        }
    }
}

#Preview {
    ProximosDias()
}

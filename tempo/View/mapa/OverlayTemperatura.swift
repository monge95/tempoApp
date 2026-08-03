//
//  OverlayTemperatura.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 22/07/26.
//
// HeatmapOverlay.swift
import SwiftUI

struct OverlayTemperatura: View {
    var body: some View {
        ZStack {
            ZStack{
                
          
            LinearGradient(
                stops: [
                    .init(color: Color("vermelho"),    location: 0.00),
                    .init(color: Color("laranja"), location: 0.38),
                    .init(color: Color("mostarda"), location: 0.52),
                    .init(color: Color("verde"),  location: 0.68),
                    .init(color: Color("ciano"),   location: 0.80),
                    .init(color: Color("azul"),   location: 1.00),
                ],
                startPoint: .top,   
                endPoint: .bottom
            )

            RadialGradient(
                           colors: [
                               Color("heatRed").opacity(0.7),
                               Color("heatOrange").opacity(0.3),
                               .clear
                           ],
                           center: UnitPoint(x: 0.5, y: 0.35),
                           startRadius: 0,
                           endRadius: 280
                       )

                       // Blob frio no sul
                       RadialGradient(
                           colors: [
                               Color("heatBlue").opacity(0.6),
                               Color("heatCyan").opacity(0.2),
                               .clear
                           ],
                           center: UnitPoint(x: 0.5, y: 0.9),
                           startRadius: 0,
                           endRadius: 220
                       )
            
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .opacity(0.78)
            .blendMode(.multiply)
            .allowsHitTesting(false)// deixa o toque passar pro mapa
      
            Image("legendaDeCalor")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .allowsHitTesting(false)
            
                    }
    }
}

#Preview {
    OverlayTemperatura()
}

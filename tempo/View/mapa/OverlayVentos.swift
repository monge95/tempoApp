//
//  OverlayVentos.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 27/07/26.
//
//
//  OverlayTemperatura.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 22/07/26.
//
// HeatmapOverlay.swift
import SwiftUI

struct OverlayVentos: View {
    var body: some View {
        ZStack {
 
                Image("FundoDosVentos")
                    .resizable()
            
                    .opacity(0.68)
                    .ignoresSafeArea()
                    .blendMode(.multiply)
                    .allowsHitTesting(false)// deixa o toque passar prara mapa
                    
      
            Image("LegendaVentos")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal)
           
            
                    }
    }
}

#Preview {
    OverlayVentos()
}

    
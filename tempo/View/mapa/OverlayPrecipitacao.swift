//
//  OverlayPrecipitacao.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//

import SwiftUI

struct OverlayPrecipitacao: View {
    var body: some View {
        ZStack {
      
            Image("FundoPresipitacao")
                .resizable()
                .opacity(0.68)
                .ignoresSafeArea()
                .blendMode(.multiply)
                .allowsHitTesting(false)


            Image("LegendaPrecipitacao")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.horizontal)
                .allowsHitTesting(false)
        }
    }
}

#Preview {
    OverlayPrecipitacao()
}

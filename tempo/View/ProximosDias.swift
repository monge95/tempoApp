//
//  constant.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 22/07/26.
//

import SwiftUI

struct ProximosDias : View {
    var body: some View {
        ZStack {
            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Proximos dias")
            }
        }
    }
}

#Preview {
    ProximosDias()
}

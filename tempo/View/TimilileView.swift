//
//  TimilileView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//

import SwiftUI

struct TimilileView: View {
    var body: some View {
        ZStack{
            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
        }
    }
}

#Preview {
    TimilileView()
}

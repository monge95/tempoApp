//
//  ContentView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 15/07/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            ScrollView{
                
            }
           
        }
    }
}

#Preview {
    ContentView()
}

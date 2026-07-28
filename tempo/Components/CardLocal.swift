//
//  Untitled.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//
import SwiftUI

struct CardLocal: View {
    let cidade: ComponenteLocalizacao
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                if cidade.isLocalAtual {
                    HStack(spacing: 4) {
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("Local Atual")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                }
                
                Text("\(cidade.local), SP")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(cidade.pais)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if !cidade.isLocalAtual {
                    Text(Date(), style: .time)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                }
            }

            VStack(alignment: .trailing) {
                Text(cidade.tempetura)
                    .font(.title.bold())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, 40)
                Text("Máx: \(cidade.maxTemp) Mín: \(cidade.minTemp)")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}
#Preview {
    CardLocal(cidade: .Mock.first!)
}

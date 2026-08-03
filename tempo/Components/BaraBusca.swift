//
//  BaraBusca.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//

import SwiftUI


struct BarraBusca: View {
    @Binding var textoBusca: String
    @Binding var cidades: [ComponenteLocalizacao]

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField("Buscar cidade, estado ou país", text: $textoBusca)
                .submitLabel(.search)
                .onSubmit {
                    adicionarCidade()
                }
            
            if !textoBusca.isEmpty {
                Button(action: { textoBusca = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.gray)
                }
            } else {
                Image(systemName: "mic.fill")
                    .foregroundStyle(.gray)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.white)
        .clipShape(Capsule())
    }

    private func adicionarCidade() {
        let nome = textoBusca.trimmingCharacters(in: .whitespaces)
        guard !nome.isEmpty else { return }

        if cidades.contains(where: { $0.local.lowercased() == nome.lowercased() }) {
            textoBusca = ""
            return
        }

        let novaCidade = ComponenteLocalizacao(
            local: nome,
            pais: "Brasil",
            tempetura: "\(Int.random(in: 18...30))C°",
            maxTemp: "\(Int.random(in: 25...35))C°",
            minTemp: "\(Int.random(in: 12...20))C°",
            isLocalAtual: false
        )

        cidades.append(novaCidade)
        textoBusca = ""
    }
}


#Preview {
    BarraBusca(
            textoBusca: .constant("São Paulo"),
            cidades: .constant(ComponenteLocalizacao.Mock)
        )
        .padding()
        .background(LinearGradient(
            colors: [.blue.opacity(0.3), .cyan.opacity(0.15)],
            startPoint: .top,
            endPoint: .bottom
        ))
}

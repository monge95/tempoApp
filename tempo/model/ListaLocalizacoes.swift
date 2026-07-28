//
//  ListaLocalizacoes.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//


import SwiftUI


struct ListaLocalizacoes: View {
    @Binding var cidades: [ComponenteLocalizacao]

    var body: some View {
        List {
            ForEach(cidades) { cidade in
                CardLocal(cidade: cidade)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 6, leading: 16,
                                             bottom: 6, trailing: 16))
            }
            .onDelete { indexSet in
                cidades.remove(atOffsets: indexSet)
            }
            .onMove { origem, destino in
                cidades.move(fromOffsets: origem, toOffset: destino)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
    }
}


//
//  SeletorLocal.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 26/07/26.
//
import SwiftUI
import Combine

class SeletorLocal: ObservableObject {
    @Published var cidadeSelecionada: String
    @Published var showPicker: Bool = false

    let cidades: [(nome: String, pais: String, atual: Bool)] = [
        ("São Paulo, SP", "Brasil", true),
        ("Sorocaba, SP", "Brasil", false),
        ("Jundiaí, SP", "Brasil", false)
    ]

    init(cidadeInicial: String = "São Paulo, SP") {
        self.cidadeSelecionada = cidadeInicial
    }

    func selecionar(_ cidade: String) {
        withAnimation(.easeInOut(duration: 0.25)) {
            cidadeSelecionada = cidade
            showPicker = false
        }
    }
}

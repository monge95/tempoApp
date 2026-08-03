//
//  ComponenteLocalizacao.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//

import Foundation
import SwiftUI
import Combine

struct ComponenteLocalizacao: Identifiable {
    let id = UUID()
    let local: String
    let pais: String
    let tempetura: String
    let maxTemp: String
    let minTemp: String
    let isLocalAtual: Bool
    
    
    static let Mock: [ComponenteLocalizacao] = [
        ComponenteLocalizacao(local: "São Paulo", pais: "Brasil", tempetura: "24C°", maxTemp: "27C°", minTemp: "24C°", isLocalAtual: true),
        ComponenteLocalizacao(local: "Sorocaba", pais: "Brasil", tempetura: "20C°", maxTemp: "21C°", minTemp: "15C°", isLocalAtual: false),
        ComponenteLocalizacao(local: "Bunito", pais: "Brasil", tempetura: "19C°", maxTemp: "20C°", minTemp: "18C°", isLocalAtual: false)

    ]
}




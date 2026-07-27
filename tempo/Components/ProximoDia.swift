//
//  ProximoDia.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 27/07/26.
//

import SwiftUI

// Modelo simples para o ícone + cor
struct ClimaIcon: Identifiable {
    let id = UUID()
    let icon: String
    let color: Color
    let color2: Color
}

struct ProximoDia: View {
    var quantidade: Int

    private var datas: [Date] {
        (0..<quantidade).compactMap {
            Calendar.current.date(byAdding: .day, value: $0, to: Date())
        }
    }

    // Pool de ícones possíveis — sorteia 4 por card
    private let icones: [ClimaIcon] = [
        ClimaIcon(icon: "sun.max.fill",      color: .yellow, color2: .yellow),
        ClimaIcon(icon: "cloud.sun.fill",    color: .white, color2: .yellow),
        ClimaIcon(icon: "cloud.fill",        color: .white,   color2: .white),
        ClimaIcon(icon: "cloud.rain.fill",   color: .white,   color2: .blue),
        ClimaIcon(icon: "cloud.bolt.fill",   color: .white, color2: .yellow),
        ClimaIcon(icon: "moon.stars.fill",   color: .indigo, color2: .indigo),
        ClimaIcon(icon: "cloud.moon.fill",   color: .white, color2: .indigo),
        ClimaIcon(icon: "sun.haze.fill",     color: .orange, color2: .orange),
        ClimaIcon(icon: "cloud.fog.fill",    color: .white,   color2: .white)
    ]

    // Sorteia 4 ícones únicos para um card
    private func sortearIcones() -> [ClimaIcon] {
        var pool = icones
        return (0..<4).map { _ in
            let indice = Int.random(in: 0..<pool.count)
            return pool.remove(at: indice)
        }
    }

    var body: some View {
        let ptBR = Locale(identifier: "pt_BR")

        VStack {
            ForEach(datas, id: \.self) { data in
                let iconesDoDia = sortearIcones()

                VStack(spacing: 16) {
                    let weekday = data.formatted(.dateTime.weekday(.wide).locale(ptBR))
                    let day = data.formatted(.dateTime.day().locale(ptBR))
                    let month = data.formatted(.dateTime.month(.wide).locale(ptBR))

                    Text("\(weekday) \(day) de \(month)".capitalized)
                        .foregroundStyle(Color.white)
                        .font(.subheadline.weight(.semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: 16) {
                        HStack {
                            Text("06h")
                                .frame(maxWidth: .infinity)
                            Text("12h")
                                .frame(maxWidth: .infinity)
                            Text("18h")
                                .frame(maxWidth: .infinity)
                            Text("00h")
                                .frame(maxWidth: .infinity)

                        }
                        .frame(maxWidth: .infinity)

                        .foregroundStyle(Color.white)

                        HStack {
                            ForEach(iconesDoDia) { clima in
                                               
                                Image(systemName: clima.icon)
                                    .foregroundStyle(clima.color, clima.color2)                                    .frame(maxWidth: .infinity)
                            }
                        }
                        .font(Font.system(size: 40))

                        HStack {
                            Text("20ºC")
                                .frame(maxWidth: .infinity)

                            Text("24ºC")
                                .frame(maxWidth: .infinity)

                            Text("20ºC")
                                .frame(maxWidth: .infinity)

                            Text("19ºC")
                                .frame(maxWidth: .infinity)

                        }
                        .foregroundStyle(Color.white)
                    }
                }
                .padding()
                .background(Color.blue.opacity(0.8))
                .shadow(radius: 10)
                .cornerRadius(20)
                .padding(.bottom,20)
            }
            .background(Color.black.opacity(0.0))
        }
    }
}

#Preview {
    ProximoDia(quantidade: 3)
}

//
//  WeatherInfoCard.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 24/07/26.
//
import SwiftUI

struct WeatherInfoCard: View {

    var body: some View {

        RoundedRectangle(cornerRadius: 15)
            .fill(.white.opacity(0.90))
            .shadow(color: .black.opacity(0.15), radius: 8, y: 4)
            .overlay {

                VStack(spacing: 14) {

                    WeatherInfoRow(
                        icon: "thermometer.variable",
                        title: "Temperatura",
                        value: "24°"
                    )

                    WeatherInfoRow(
                        icon: "thermometer.medium",
                        title: "Sensação térmica",
                        value: "26°"
                    )

                    WeatherInfoRow(
                        icon: "drop.fill",
                        title: "Umidade",
                        value: "55%"
                    )

                    WeatherInfoRow(
                        icon: "wind",
                        title: "Vento",
                        value: "12 km/h"
                    )

                    WeatherInfoRow(
                        icon: "umbrella.fill",
                        title: "Chance de chuva",
                        value: "10%"
                    )
                    WeatherInfoRow(
                        icon: "sun.max.fill",
                        title: "Índice UV",
                        value: "Alto"
                    )

                }
                .padding(.vertical, 25)

            }
            .frame(height: 420)

    }
}

#Preview {
    WeatherInfoCard()
        .padding()
}

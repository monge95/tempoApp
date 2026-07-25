//
//  WeatherInfoRow.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 24/07/26.
//
import SwiftUI

struct WeatherInfoRow: View {

    let icon: String
    let title: String
    let value: String

    var body: some View {

        HStack(spacing: 16) {

            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundStyle(Color("Icons"))
                .frame(width: 35)

            Text(title)
                .font(.system(size: 18, weight: .medium, design: .rounded))

            Spacer()

            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))

        }
        .padding(.horizontal, 24)
        .frame(height: 55)
    }
}

#Preview {
    WeatherInfoRow(
        icon: "thermometer.medium",
        title: "Temperatura",
        value: "24°"
    )
}


//
//  SunTimeCard.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 25/07/26.
//
import SwiftUI

struct SunTimeCard: View {

    var body: some View {

        VStack(spacing: 0) {

            SunTimeRow(
                icon: "clock.fill",
                iconColor: .indigo,
                title: "Nascer do sol",
                time: "06:32"
            )

            Divider()
                .background(Color.gray.opacity(0))
                

            SunTimeRow(
                icon: "sunrise.fill",
                iconColor: .orange,
                title: "Pôr do sol",
                time: "17:52"
            )

            Divider()
                

            SunTimeRow(
                icon: "sun.max.fill",
                iconColor: .yellow,
                title: "Duração do dia",
                time: "11h 20min"
            )

            Divider()
                

            SunTimeRow(
                icon: "sun.horizon.fill",
                iconColor: .blue,
                title: "Início do crepúsculo",
                time: "17:27"
            )

            Divider()
                

            SunTimeRow(
                icon: "moon.fill",
                iconColor: .indigo,
                title: "Fim do crepúsculo",
                time: "18:17"
            )
        }
        .padding(.vertical, 10)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.15),
                radius: 8,
                x: 0,
                y: 4)
    }
}

#Preview {
    SunTimeCard()
}

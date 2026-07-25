//
//  SunInfoCard.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 25/07/26.
//
import SwiftUI

struct SunInfoCard: View {

    var body: some View {

        RoundedRectangle(cornerRadius: 15)
            .fill(Color("SunCard"))
            .overlay {

                HStack(spacing: 0) {

                    SunInfoItem(
                        icon: "sun.max",
                        title: "Altura",
                        value: "48°",
                        subtitle: "Acima do horizonte"
                    )

                   

                    SunInfoItem(
                        icon: "location",
                        title: "Azimute",
                        value: "330°",
                        subtitle: "Sudoeste"
                    )

                    Rectangle()
                        .fill(Color(red: 0.08, green: 0.29, blue: 0.67))
                        .frame(width: 0.5)

                    SunInfoItem(
                        icon: "lightbulb",
                        title: "Luz",
                        value: "Alta",
                        subtitle: "Luz forte"
                    )

                   

                    SunInfoItem(
                        icon: "sun.max",
                        title: "Índice UV",
                        value: "Alto",
                        subtitle: "UV 7"
                    )

                }
                .padding(.horizontal, 5)
                .padding(.vertical, 20)

            }
            .frame(height: 140)
            .shadow(color: .black.opacity(0.2),radius: 10,y: 6)
    }
}

#Preview {
    ZStack {
        Color.gray
        SunInfoCard()
            .padding()
    }
}

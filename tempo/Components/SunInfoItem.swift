//
//  SunInfoItem.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 25/07/26.
//
import SwiftUI

struct SunInfoItem: View {

    let icon: String
    let title: String
    let value: String
    let subtitle: String

    var body: some View {

        VStack(spacing: 8) {

            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundStyle(.yellow)

            Text(title)
                .font(.system(size: 11,
                              weight: .medium,
                              design: .rounded))
                .foregroundStyle(.white)

            Text(value)
                .font(.system(size: 16,
                              weight: .bold,
                              design: .rounded))
                .foregroundStyle(.white)

            Text(subtitle)
                .font(.system(size: 13, weight: .regular, design: .rounded))
                .foregroundStyle(.white.opacity(0.95))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(height: 36, alignment: .top)

            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)    }
}

#Preview {
    SunInfoItem(
        icon: "sun.max",
        title: "Altura",
        value: "48°",
        subtitle: "Acima do horizonte"
    )
}

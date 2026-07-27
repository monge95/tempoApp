//
//  SunTimeRow.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 25/07/26.
//
import SwiftUI

struct SunTimeRow: View {

    let icon: String
    let iconColor: Color
    let title: String
    let time: String

    var body: some View {

        HStack(spacing: 16) {

            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundStyle(iconColor)
                .frame(width: 30)

            Text(title)
                .font(.system(size: 13,
                              weight: .medium,
                              design: .rounded))
                .foregroundStyle(.black)

            Spacer()

            Text(time)
                .font(.system(size: 13,
                              weight: .bold,
                              design: .rounded))
                .foregroundStyle(.black)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
    }
}

#Preview {
    SunTimeRow(
        icon: "sunset.fill",
        iconColor: .orange,
        title: "Pôr do sol",
        time: "17:52"
    )
}

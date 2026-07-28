//
//  SeletorLocal.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//

import SwiftUI

struct SeletorLocalMap: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "list.bullet")
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.secondary)
            Text("Em desenvolvimento")
                .font(.system(size: 13, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(width: 170, height: 90)
        .background(.ultraThinMaterial)
        .background(Color(.systemBackground).opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
    }
}

#Preview {
    SeletorLocalMap()
}

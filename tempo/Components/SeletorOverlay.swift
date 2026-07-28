//
//  SeletorOverlay.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 27/07/26.
//



import SwiftUI

// SeletorOverlay.swift
import SwiftUI

struct SeletorOverlay: View {
    @Binding var overlayAtivo: OverlayType

    var body: some View {
        VStack(spacing: 2) {
            botao(.temperatura, icon: "thermometer.medium", label: "Temp")
            botao(.ventos, icon: "wind", label: "Vento")
            botao(.nenhum, icon: "eye.slash", label: "Off")
        }
        .padding(4)
        .background(.ultraThinMaterial)
        .background(Color(.systemBackground).opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
    }

    private func botao(_ tipo: OverlayType, icon: String, label: String) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                overlayAtivo = tipo
            }
        } label: {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 14, weight: .medium))
                Text(label)
                    .font(.system(size: 13, weight: .semibold))
            }
            .foregroundStyle(overlayAtivo == tipo ? .white : .primary)
            .frame(height: 34)
            .frame(maxWidth: .infinity)
            .background {
                if overlayAtivo == tipo {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.blue)
                }
            }
        }
    }
}
#Preview {
    SeletorOverlay(overlayAtivo: .constant(.temperatura))
}

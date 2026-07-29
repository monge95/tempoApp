//
//  SeletorLocalMap.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 28/07/26.
//

import SwiftUI

struct SeletorLocalMap: View {
    @StateObject private var vm = SeletorLocal()
    var onSelecao: () -> Void = {}

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(vm.cidadeSelecionada)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundStyle(.primary)
                Spacer()
                Button {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        onSelecao()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.gray)
                        .padding(6)
                        .background(Color.gray.opacity(0.15))
                        .clipShape(Circle())
                }
            }
            .padding(.bottom, 4)

            // Lista de cidades
            VStack(spacing: 8) {
                ForEach(vm.cidades, id: \.nome) { cidade in
                    Button {
                        vm.selecionar(cidade.nome)
                        onSelecao()
                    } label: {
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(cidade.nome)
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.primary)

                                if cidade.atual {
                                    HStack(spacing: 4) {
                                        Image(systemName: "location.fill")
                                            .font(.system(size: 10))
                                        Text("Local atual")
                                    }
                                    .font(.system(size: 12))
                                    .foregroundStyle(.blue)
                                }

                                Text(cidade.pais)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            if vm.cidadeSelecionada == cidade.nome {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(.blue)
                            }
                        }
                        .padding(12)
                        .background(Color.gray.opacity(0.08))
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                    }
                }
            }
        }
        .padding(16)
        .background(.ultraThinMaterial)
        .background(Color(.systemBackground).opacity(0.85))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 8, y: 3)
        .frame(width: 200)
    }
}

#Preview {
    SeletorLocalMap()
}

#Preview {
    SeletorLocalMap()
}

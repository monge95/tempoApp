//
//  Seletor.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 26/07/26.
//

import SwiftUI

struct Seletor: View {
    @StateObject private var seletroVm = SeletorLocal()

    var body: some View {
        ZStack {
            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    seletroVm.showPicker = true
                }
            } label: {
                HStack(spacing: 4) {
                    Text(seletroVm.cidadeSelecionada)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundStyle(.white)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                }
            }   

            if seletroVm.showPicker {
                    VStack{
                        
                        HStack {
                            Text(seletroVm.cidadeSelecionada)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(.primary)
                            Spacer()
                            Button {
                                withAnimation(.easeInOut(duration: 0.25)) {
                                    seletroVm.showPicker = false
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundStyle(.gray)
                                    .padding(8)
                                    .background(Color.gray.opacity(0.15))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.bottom, 16)

                        // Lista de cidades
                        VStack(spacing: 12) {
                            ForEach(seletroVm.cidades, id: \.nome) { cidade in
                                Button {
                                    seletroVm.selecionar(cidade.nome)
                                } label: {
                                    HStack {
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(cidade.nome)
                                                .font(.system(size: 16, weight: .semibold))
                                                .foregroundStyle(.primary)
                                            if cidade.atual {
                                                Text("Local atual")
                                                    .font(.system(size: 13))
                                                    .foregroundStyle(.blue)
                                            }
                                            Text(cidade.pais)
                                                .font(.system(size: 13))
                                                .foregroundStyle(.secondary)
                                        }
                                        Spacer()
                                        if seletroVm.cidadeSelecionada == cidade.nome {
                                            Image(systemName: "checkmark")
                                                .foregroundStyle(.blue)
                                        }
                                    }
                                    .padding(16)
                                    .background(Color.gray.opacity(0.08))
                                    .clipShape(RoundedRectangle(cornerRadius: 14))
                                }
                            }
                        }
                    }
                    .padding(20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
                    .padding(.horizontal, 24)
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
    }
}

#Preview {
    Seletor()
        .background(Color.gray)
}

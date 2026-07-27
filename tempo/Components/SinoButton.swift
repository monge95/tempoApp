//
//  SinoButton.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 26/07/26.
//
import SwiftUI

struct SinoButton: View {
    @State private var showPopover = false

    var body: some View {
        Button {
            showPopover.toggle()
        } label: {
            Image(systemName: "bell.circle.fill")
                .font(.system(size: 44))
                .foregroundStyle(.white)
                .padding(.leading, 10)
        }
        .fullScreenCover(isPresented: $showPopover) {
            ZStack {
                // Fundo escuro cobrindo tudo
                Color.black.opacity(0.1)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showPopover = false
                    }

                // Card
                VStack(spacing: 16) {
                    HStack {
                        Text("Timeline")
                            .font(.custom("sfpro-semibold", size: 18, relativeTo: .headline))

                        Spacer()

                        Button {
                            showPopover = false
                        } label: {
                            Image(systemName: "xmark")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundStyle(.gray)
                                .padding(8)
                                .background(Color.gray.opacity(0.15))
                                .clipShape(Circle())
                        }
                    }

                    HStack(spacing: 8) {
                        Image(systemName: "cloud.heavyrain.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(.blue)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Chuva forte")
                                .font(.custom("sfpro-semibold", size: 16))
                                .foregroundStyle(.primary)

                            Text("Há previsão de chuva intensa na sua região a partir das 17:00.")
                                .font(.system(size: 13))
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                    }

                    Button {
                        // ação do "ver no mapa"
                    } label: {
                        Text("Ver no mapa")
                            .font(.custom("sfpro-semibold", size: 15))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
                .padding(.horizontal, 40)
            }
            .presentationBackground(.clear)
        }
    }
}

#Preview {
    SinoButton()
}

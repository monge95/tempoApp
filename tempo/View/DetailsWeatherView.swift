//
//  DetailsWeatherView.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 24/07/26.
//

import SwiftUI

struct DetailsWeatherView: View {

    @Binding var selectedTab: AppTab
    var onClose: (() -> Void)? = nil

    var body: some View {

        ZStack {

            Image("fundo")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {

                

                HStack {

                    Button {
                        selectedTab = .timeline
                    } label: {

                        Circle()
                            .fill(.white.opacity(0.8))
                            .frame(width: 48, height: 48)
                            .overlay {

                                Image(systemName: "chevron.left")
                                    .font(.title3)
                                    .foregroundStyle(.blue)

                            }

                    }

                    Spacer()

                    Text("Detalhes do clima")
                        .font(.system(size: 22,
                                      weight: .semibold,
                                      design: .rounded))
                        .foregroundStyle(.white)

                    Spacer()

                    Circle()
                        .fill(.white.opacity(0.8))
                        .frame(width: 48, height: 48)
                        .overlay {

                            Image(systemName: "bell")
                                .font(.title2)
                                .foregroundStyle(.blue)

                        }

                }
                .padding(.horizontal, 24)
                .padding(.top, 50)
                .padding(.bottom, 20)

                

                ScrollView(.vertical, showsIndicators: false) {

                    VStack(spacing: 22) {

                        VStack(spacing: 6) {

                            Text("14:00")
                                .font(.system(size: 50,
                                              weight: .semibold,
                                              design: .rounded))
                                .foregroundStyle(.white)

                            Text("Hoje, 22 de jun.")
                                .font(.system(size: 18,
                                              weight: .medium,
                                              design: .rounded))
                                .foregroundStyle(.white)

                            Image("partlyCloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 155)

                        }

                       
                        VStack(spacing: 6) {

                            Text("24°")
                                .font(.system(size: 64,
                                              weight: .medium,
                                              design: .rounded))
                                .foregroundStyle(.black)

                            Text("Parcialmente Nublado")
                                .font(.system(size: 18,
                                              weight: .semibold,
                                              design: .rounded))
                                .foregroundStyle(.black)

                        }

                        WeatherInfoCard()
                         .padding(.horizontal, 22)

                       Spacer()
                            .frame(height: 120)
                    }
                   

                }


                ZStack {

                    Rectangle()
                        .fill(.ultraThinMaterial)

                    HStack(spacing: 8) {

                        Circle()
                            .fill(.black)
                            .frame(width: 8,height: 8)

                        Circle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 8,height: 8)

                    }

                }
                .frame(height:60)

            }

        }

    }

}

#Preview {
    DetailsWeatherView(selectedTab: .constant(.timeline))
}

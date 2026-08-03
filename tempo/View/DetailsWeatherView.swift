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
                GeometryReader { geo in
                    
                    
                    ZStack {
                        
                        Image("fundo")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                        
                        VStack(spacing: 0) {
                            ZStack {
                                Text("Mais Informações")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundStyle(.white)
                                
                                // sino
                                HStack {
                                    Spacer()
                                    SinoButton()
                                        .padding(.trailing)
                                }
                            }
                            .padding(.top, geo.size.height / 10)
                            
                            
                            
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
                            
                        }
                        
                    }
                    .ignoresSafeArea(edges: .all)
                    .background(Color.blue)
                }
                
            }
        }
        #Preview {
            DetailsWeatherView(selectedTab: .constant(.timeline))
        }


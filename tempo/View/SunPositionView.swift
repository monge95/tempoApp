//
//  SunPositionView.swift
//  tempo
//
//  Created by Mariana Fracaroli Lopes on 25/07/26.
//

import SwiftUI

struct SunPositionView: View {
    @State var showPopover: Bool = false
    @Binding var selectedTab: AppTab

    var body: some View {
        GeometryReader{ geo in
            
            
            ZStack {
                
                Image("backgroundSun")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        
                        Spacer()
                        Spacer()
                        
                        Text("Posição do Sol")
                            .font(.system(size: 22,
                                          weight: .semibold,))
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        SinoButton()
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, geo.size.height / 10)
                    
                    Spacer()
                        .frame(height: 25)
                    
                    
                    VStack(spacing: 6) {
                        
                        Text("São Paulo, SP")
                            .font(.system(size: 20,
                                          weight: .semibold,
                                          design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("Seg, 14:00")
                            .font(.system(size: 16,
                                          weight: .regular,
                                          design: .rounded))
                            .foregroundStyle(.white)
                        
                    }
                    
                    Spacer()
                        .frame(height: 22)
                    
                    
                    Image("SunArc")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 420, height: 180)
                        .padding(.top, 36)
                        .padding(.bottom, 10)
                    
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: 16) {
                            
                            SunInfoCard()
                                .padding(.horizontal, 24)
                            
                            SunTimeCard()
                                .padding(.horizontal, 26)
                            
                            Text("Os horários podem variar levemente")
                                .font(.system(size: 14,
                                              weight: .regular,
                                              design: .rounded))
                                .foregroundStyle(.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 34)
                                .padding(.bottom, 20)
                            
                        }
                        .padding(.top, 5)
                    }
                    .padding(.bottom, 10)
                    
                    
                    
                    
                }
                
            }
            .ignoresSafeArea()
        }

    }

}

#Preview {
    SunPositionView(selectedTab: .constant(.timeline))
}

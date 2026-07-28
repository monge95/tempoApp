//
//  PagedWeatherView.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 27/07/26.
//

import SwiftUI

struct PagedWeatherView: View {
    @Binding var selectedTab: AppTab
    @State private var currentPage = 0
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            // TabView com swipe horizontal entre as 2 telas
            TabView(selection: $currentPage) {
                DetailsWeatherView(selectedTab: $selectedTab)
                    .tag(0)

                SunPositionView(selectedTab: $selectedTab)
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Circle()
                            .fill(.white.opacity(0.8))
                            .frame(width: 44, height: 44)
                            .overlay {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundStyle(.blue)
                            }
                    }
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, )

                Spacer()

                // Os pontinhos de paginação embaixo
                HStack(spacing: 8) {
                    Circle()
                        .fill(currentPage == 0 ? .black : .gray.opacity(0.5))
                        .frame(width: 8, height: 8)

                    Circle()
                        .fill(currentPage == 1 ? .black : .gray.opacity(0.5))
                        .frame(width: 8, height: 8)
                }
                .padding(.bottom, 16)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
   
        .navigationBarBackButtonHidden()
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    PagedWeatherView(selectedTab: .constant(.timeline))
}

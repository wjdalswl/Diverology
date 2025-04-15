//
//  CustomTabBarView.swift
//  Diverology
//
//  Created by jeongminji on 4/15/25.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selectedTab: BottomTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack {
                switch selectedTab {
                case .home:
                    ContentView()
                case .list:
                    ContentView()
                case .mypage:
                    ContentView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(
                selectedTab: $selectedTab
            )
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    CustomTabBarView()
}

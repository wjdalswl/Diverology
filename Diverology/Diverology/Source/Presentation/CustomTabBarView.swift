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
        VStack(spacing: 0) {
            switch selectedTab {
            case .home:
                HomeView()
            case .list:
                ListView()
            case .mypage:
                ProfileDetailView(viewType: .my)
            }
            
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

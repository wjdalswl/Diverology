//
//  Tabbar.swift
//  Diverology
//
//  Created by jeongminji on 4/15/25.
//

import SwiftUI

enum BottomTab: String, CaseIterable {
    case home = "Home"
    case list = "List"
    case mypage = "Mypage"
}

struct CustomTabBar: View {
    @Binding var selectedTab: BottomTab
    
    private let tabs: [(BottomTab, String, String, CGFloat)] = [
        (.home, "house", "홈", 23),
        (.list, "list.bullet", "리스트", 23),
        (.mypage, "person", "마이페이지", 22)
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.0) { tab, imageName, label, imageSize in
                TabButton(
                    isSelected: selectedTab == tab,
                    imageName: imageName,
                    label: label,
                    imageSize: imageSize
                ) {
                    withAnimation {
                        selectedTab = tab
                    }
                }
                if tab != tabs.last?.0 {
                    Spacer()
                }
            }
        }
        .frame(height: 87)
        .padding(.init(horizontal: 53, bottom: 30))
        .background(
            ZStack {
                Color.blue500
                Color.white.opacity(0.3)
            }
        )
    }
}

struct TabButton: View {
    let isSelected: Bool
    let imageName: String
    let label: String
    let imageSize: CGFloat
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: "\(imageName)")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .foregroundStyle(isSelected ? .semanticBlue600 : .white)
                
                Text(label)
                    .font(.pretendard(.medium, size: 12))
                    .foregroundStyle(isSelected ? .semanticBlue600 : .white)
            }
            .frame(width: 52, height: 38)
        }
    }
}

#Preview {
    @Previewable
    @State var selectedTab: BottomTab = .home
    
    return HStack {
        CustomTabBar(
            selectedTab: $selectedTab
        )
    }
    .frame(maxHeight: .infinity)
    .background(.blue500)
}

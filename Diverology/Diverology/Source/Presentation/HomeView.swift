//
//  HomeView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var currentIndex: Int = 0
    
    private let items = Array(0..<3)
    private let spacing: CGFloat = 43
    private let cardPadding: CGFloat = 63
    private var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 2 * cardPadding
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                BackgroundImageView()
                
                VStack(spacing: 35) {
                    CustomNavigationBar(
                        showBackButton: false,
                        showLogo: true
                    )
                    
                    NameDropCard(nickName: "My")
                        .padding(.horizontal, cardPadding)
                    
                    SectionTitleView(title: "Recently collected")
                    
                    HorizontalScrollView(
                        items: items,
                        cardWidth: cardWidth,
                        spacing: spacing,
                        currentIndex: $currentIndex
                    )
                }
                .padding(.top, geometry.safeAreaInsets.top)
            }
            .ignoresSafeArea(edges: .all)
        }
    }
}

// MARK: - Components
    
struct NameDropCard: View {
    let nickName: String
    
    var body: some View{
        VStack(spacing: 22) {
            Image(systemName: "chevron.up")
                .foregroundColor(.gray400)
            
            Image(.imgEmpty)
                .resizable()
                .frame(width: 131.98, height: 131.98)
                .cornerRadius(65.99)
                .shadow(
                    color: .semanticBlue600.opacity(0.1),
                    radius: 23,
                    x: 4,
                    y: 9
                )
                .shadow(
                    color: .blue300.opacity(0.4),
                    radius: 23,
                    x: -4,
                    y: 9
                )
            
            Text(nickName)
                .titleText()
                .padding(.bottom, 3)
            
            Text("상대와 NameDrop을 통해\n내 명함을 공유해 보세요!")
                .foregroundColor(.gray400)
                .font(.pretendard(.regular, size: 15))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 321)
        .background(.white)
        .cornerRadius(14)
    }
}

struct SectionTitleView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.blue900)
            .font(.pretendard(.bold, size: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
    }
}


struct HorizontalScrollView: View {
    let items: [Int]
    let cardWidth: CGFloat
    let spacing: CGFloat
    @Binding var currentIndex: Int
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: spacing) {
                    ForEach(items, id: \.self) { index in
                        ProfileCard(
                            nickName: "000",
                            phoneNum: "010-0000-0000",
                            githubId: "wjdalswl",
                            instaId: "@pqrqpin2274",
                            imageName: "aa"
                        )
                        .frame(width: cardWidth)
                        .id(index)
                    }
                }
                .padding(.horizontal, 63)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            let dragOffset = value.translation.width
                            let threshold: CGFloat = 50
                            if dragOffset < -threshold && currentIndex < items.count - 1 {
                                currentIndex += 1
                            } else if dragOffset > threshold && currentIndex > 0 {
                                currentIndex -= 1
                            }
                            
                            withAnimation {
                                proxy.scrollTo(currentIndex, anchor: .center)
                            }
                        }
                )
            }
        }
        .frame(height: 144)
    }
}


struct ProfileCard: View {
    let nickName: String
    let phoneNum: String
    let githubId: String
    let instaId: String
    let imageName: String
    
    var body: some View{
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(nickName)
                    .titleText()
                    .padding(.bottom, 12)
                
                Text(phoneNum)
                    .foregroundColor(.blue700)
                    .font(.pretendard(.regular, size: 10))
                Text(phoneNum)
                    .foregroundColor(.blue700)
                    .font(.pretendard(.regular, size: 10))
                Text(githubId)
                    .foregroundColor(.blue700)
                    .font(.pretendard(.regular, size: 10))
                Text(instaId)
                    .foregroundColor(.blue700)
                    .font(.pretendard(.regular, size: 10))
            }
            
            Spacer()
            
            Image(.imgEmpty)
                .resizable()
                .witProfileStyle(size: 131.98)
                .offset(x: 18.98, y: 17.98)
        }
        .padding(.leading, 10)
        .background(.white)
        .cornerRadius(14)
    }
}
    


#Preview {
    HomeView()
}

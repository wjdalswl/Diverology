//
//  ListView.swift
//  Diverology
//
//  Created by jeongminji on 4/15/25.
//

import SwiftUI

struct ListView: View {
    
    @State var inputText: String = ""
    @State private var selectedFilter: TimeFilter = .all
    
    let names = (1...30).map { "Diver \($0)" }
    
    let spacing: CGFloat = 20
    let columns: Int = 3

    var body: some View {
        GeometryReader { geometry in
            let totalSpacing = spacing * CGFloat(columns - 1)
            let availableWidth = geometry.size.width - (20 * 2) - totalSpacing
            let itemWidth = availableWidth / CGFloat(columns)
            
            ZStack(alignment: .top) {
                BackgroundImageView()
                
                VStack(spacing: 20) {
                    CustomTextField(
                        text: $inputText,
                        placeholder: "검색어를 입력해주세요.",
                        image: Image(systemName: "magnifyingglass")
                    )
                    .padding(.horizontal, 20)
                    
                    HStack(spacing: 10) {
                        ForEach(TimeFilter.allCases, id: \.self) { filter in
                            FilterButton(
                                title: filter.rawValue,
                                isSelected: selectedFilter == filter
                            ) {
                                selectedFilter = filter
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: spacing) {
                            ForEach(names.chunked(into: columns), id: \.self) { row in
                                HStack(spacing: spacing) {
                                    ForEach(row, id: \.self) { name in
                                        ProfileBadge(
                                            nickName: name,
                                            imgSize: itemWidth
                                        )
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                        }
                    }
                }
                .padding(.top, geometry.safeAreaInsets.top)
            }
            .ignoresSafeArea(edges: .all)
        }
    }
}

// MARK: - Components

struct ProfileBadge: View {
    let nickName: String
    var imgSize: CGFloat = 136
    
    var body: some View{
        VStack(spacing: 5) {
            Image(.imgEmpty)
                .resizable()
                .witProfileStyle(size: imgSize)
            
            Text(nickName)
                .foregroundColor(.blue900)
                .font(.pretendard(.medium, size: 12))
        }
    }
}

#Preview {
    ListView()
}


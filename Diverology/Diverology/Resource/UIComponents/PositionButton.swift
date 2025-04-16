//
//  PositionButton.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct PositionButton: View {
    let position: Position
    let isSelected: Bool
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            ZStack {
                if isSelected {
                    Circle()
                        .fill(.white)
                } else {
                    Image(.imgBtnBackground)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                }
                
                VStack(spacing: 5) {
                    position.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 41, height: 41)
                        .foregroundColor(isSelected ? .blue600 : .white)
                    
                    Text(position.title)
                        .font(.pretendard(.medium, size: 15))
                        .foregroundColor(isSelected ? .blue600 : .white)
                }
            }
            .frame(width: 95, height: 95)
            .shadow(
                color: isSelected ? .black.opacity(0.1) : .clear,
                radius: 4,
                x: 4,
                y: 4
            )
        }
        .buttonStyle(.plain)
    }
}


#Preview {
    @Previewable
    @State var selected: Position = .domain
    
    return HStack {
        ForEach(Position.allCases, id: \.self) { position in
            PositionButton(
                position: position,
                isSelected: selected == position
            ) {
                selected = position
            }
        }
    }
}

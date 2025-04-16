//
//  FilterButton.swift
//  Diverology
//
//  Created by jeongminji on 4/15/25.
//

import SwiftUI

struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            Text(title)
                .font(.pretendard(.medium, size: 20))
                .foregroundColor(isSelected ? .blue500 : .white)
                .padding(.init(horizontal: 24, vertical: 7))
                .background(
                    Capsule()
                        .fill(isSelected ? .white : .clear)
                        .stroke(.white, lineWidth: 1)
                )
        }
    }
}

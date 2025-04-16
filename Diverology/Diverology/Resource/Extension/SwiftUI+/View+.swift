//
//  View+.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

// MARK: - extension View

extension View {
    func titleText() -> some View {
        self.modifier(TitleTextModifier())
    }
    
    func witProfileStyle(
        size: CGFloat = 136
    ) -> some View {
        self.modifier(ProfileModifier(size: size))
    }
}


// MARK: - Text

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.semanticBlue600)
            .font(.pretendard(.bold, size: 25))
    }
}

// MARK: - Image

struct ProfileModifier: ViewModifier {
    var size: CGFloat = 136
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
            .cornerRadius(size / 2)
            .shadow(
                color: .black.opacity(0.1),
                radius: 10,
                x: 4,
                y: 4
            )
    }
}

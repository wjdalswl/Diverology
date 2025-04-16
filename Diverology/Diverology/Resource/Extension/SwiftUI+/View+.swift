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
    
    func basicButtonStyle(
        labelColor: Color = .white,
        backgroundColor: Color = .blue
    ) -> some View {
        self.buttonStyle(
            BasicButtonStyle(labelColor: labelColor, backgroundColor: backgroundColor)
        )
    }
    
    func imageCircleButtonStyle() -> some View {
        self.buttonStyle(ImageCircleButtonStyle())
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


// MARK: - ButtonStyle

struct BasicButtonStyle: ButtonStyle {
    var labelColor = Color.white
    var backgroundColor = Color.blue
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .foregroundColor(labelColor)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 13)
                .multilineTextAlignment(.center)
        }
        .background(backgroundColor.opacity(configuration.isPressed ? 0.7 : 1.0))
        .cornerRadius(10)
        .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
        .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ImageCircleButtonStyle: ButtonStyle {
    var backgroundColor: Color = .blue900
    var size: CGSize = CGSize(width: 23, height: 19)
    var padding: EdgeInsets = EdgeInsets(horizontal: 4.5, vertical: 6.5)
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaledToFit()
            .frame(width: size.width, height: size.height)
            .padding(padding)
            .background(
                Circle()
                    .fill(.blue900.opacity(configuration.isPressed ? 0.3 : 1.0))
            )
            .foregroundColor(.white)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

//
//  Fonts+.swift
//  Diverology
//
//  Created by jeongminji on 4/14/25.
//

import SwiftUI

// MARK: - Pretendard Font Extension

extension Font {
    enum PretendardType: String {
        case bold = "Bold"
        case semiBold = "SemiBold"
        case medium = "Medium"
        case regular = "Regular"
        case light = "Light"
    }
    
    /*
     - PretendardType에 따른 폰트 생성
     - Parameters:
            - type: 폰트 스타일 (PretendardType)
            - size: 폰트 크기 (CGFloat)
     - Example:
          ```swift
            Text("Hello, world!")
                .font(.pretendard(.bold, size: 10))
          ```
    */

    static func pretendard(_ type: PretendardType, size: CGFloat) -> Font {
        return Font.custom("Pretendard-" + type.rawValue, size: size)
    }
}

// MARK: - NewYork Font Extension

extension Font {
    static func newYork(size: CGFloat) -> Font {
        return Font.custom("NewYorkLarge-Black", size: size)
    }
}

//
//  RoundedCorner.swift
//  Diverology
//
//  Created by jeongminji on 4/17/25.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let roundedRect = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        path.addPath(Path(roundedRect.cgPath))
        
        return path
    }
}

#Preview {
    RoundedCorner(radius: 25, corners: .all)
        .frame(width: 300, height: 70)
        .foregroundStyle(.blue500)
    
    RoundedCorner(radius: 25, corners: .top)
        .frame(width: 300, height: 70)
        .foregroundStyle(.blue500)
    
    RoundedCorner(radius: 25, corners: .bottom)
        .frame(width: 300, height: 70)
        .foregroundStyle(.blue500)
    
    RoundedCorner(radius: 25, corners: .leading)
        .frame(width: 300, height: 70)
        .foregroundStyle(.blue500)
    
    RoundedCorner(radius: 25, corners: .trailing)
        .frame(width: 300, height: 70)
        .foregroundStyle(.blue500)
}

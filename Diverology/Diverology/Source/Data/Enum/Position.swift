//
//  Position.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

enum Position: String, CaseIterable {
    case domain = "도메인"
    case tech = "테크"
    case design = "디자인"
    
    var title: String {
        return self.rawValue
    }
    
    var image: Image {
        switch self {
        case .domain:
            return Image(systemName: "lightbulb.max")
        case .tech:
            return Image(systemName: "macbook.gen1")
        case .design:
            return Image(systemName: "paintbrush.pointed")
        }
    }
}

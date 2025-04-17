//
//  UIRectCorner+.swift
//  Diverology
//
//  Created by jeongminji on 4/17/25.
//

import SwiftUI

extension UIRectCorner {
    public static var top: UIRectCorner {
        return [.topLeft, .topRight]
    }
    
    public static var bottom: UIRectCorner {
        return [.bottomLeft, .bottomRight]
    }
    public static var leading: UIRectCorner {
        return [.topLeft, .bottomLeft]
    }
    
    public static var trailing: UIRectCorner {
        return [.topRight, .bottomRight]
    }
    
    public static var all: UIRectCorner {
        return [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }
}

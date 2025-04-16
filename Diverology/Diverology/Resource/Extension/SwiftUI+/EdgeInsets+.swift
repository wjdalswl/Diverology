//
//  EdgeInsets+.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//


import SwiftUI

extension EdgeInsets {
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    init(horizontal: CGFloat = 0, top: CGFloat = 0, bottom: CGFloat = 0) {
        self = EdgeInsets(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
    
    init(vertical: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
        self = EdgeInsets(top: vertical, leading: leading, bottom: vertical, trailing: trailing)
    }
}

//
//  BackgroundImageView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image(.imgBasicBackground)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImageView()
}

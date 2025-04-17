//
//  SplashView.swift
//  Diverology
//
//  Created by jeongminji on 4/14/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Text("Diverology")
                .foregroundStyle(.semanticBlue600)
                .font(.newYork(size: 50))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .backgroundImage()
    }
}

#Preview {
    SplashView()
}

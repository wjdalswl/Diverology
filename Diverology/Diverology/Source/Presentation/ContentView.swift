//
//  ContentView.swift
//  Diverology
//
//  Created by jeongminji on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    @State var selectedFlavor: String = ""
    
    var body: some View {
        ZStack {
            Image(.imgBasicBackground)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Diverology")
                    .font(.pretendard(.bold, size: 50))
                Text("Diverology")
                    .font(.newYork(size: 50))
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

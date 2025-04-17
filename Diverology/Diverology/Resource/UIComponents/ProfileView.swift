//
//  ProfileView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

enum ProfileType {
    case basic
    case badge
}

struct ProfileView: View {
    let nickName: String
    var type: ProfileType
    var imgSize: CGFloat = 136
    
    var body: some View {
        VStack(spacing: type == .basic ? 12 : 5) {
            Image(.imgEmpty)
                .resizable()
                .witProfileStyle(size: imgSize)
            
            if type == .basic {
                Text(nickName)
                    .titleText()
            } else {
                Text(nickName)
                    .foregroundColor(.blue900)
                    .font(.pretendard(.medium, size: 12))
            }
        }
    }
}

#Preview {
    ProfileView(nickName: "My", type: .basic)
    ProfileView(nickName: "My", type: .badge)
}

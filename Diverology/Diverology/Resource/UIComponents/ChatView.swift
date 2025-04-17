//
//  ChatView.swift
//  Diverology
//
//  Created by jeongminji on 4/17/25.
//

import SwiftUI

enum MessageType {
    case myMessage
    case otherMessage
}

struct ChatView: View {
    var text: String
    var messageType: MessageType
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 2) {
            if messageType == .otherMessage {
                CircleIndicator(size: 6, color: .semanticBlue600, paddingBottom: 0)
                CircleIndicator(size: 10, color: .semanticBlue600, paddingBottom: 4)
            }
            
            Text("\(text)")
                .foregroundColor(messageType == .otherMessage ? .white : .black)
                .font(.pretendard(.regular, size: 15))
                .padding(.init(horizontal: 14, vertical: 9))
                .background( messageType == .otherMessage ? .semanticBlue600 : .white)
                .cornerRadius(20)
            
            if messageType == .myMessage {
                CircleIndicator(size: 10, color: .white, paddingBottom: 4)
                CircleIndicator(size: 6, color: .white, paddingBottom: 0)
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: messageType == .otherMessage ? .leading : .trailing
        )
    }
}

// MARK: - Components

struct CircleIndicator: View {
    var size: CGFloat
    var color: Color
    var paddingBottom: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundColor(color)
            .padding(.bottom, paddingBottom)
    }
}

#Preview {
    VStack(spacing: 16) {
        ChatView(text: "제 닉네임의 유래는 뭘까요?", messageType: .otherMessage)
        ChatView(text: "어쩌고 저쩌고 해서 어쩌고 저쩌고, 어쩌고 저쩌고 어쩌고 저쩌고 해서 지어진 이름이다. ", messageType: .myMessage)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding(.horizontal, 20)
    .background(.blue500)
}

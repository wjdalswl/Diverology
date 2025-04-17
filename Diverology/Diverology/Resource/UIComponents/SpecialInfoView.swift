//
//  SpecialInfoView.swift
//  Diverology
//
//  Created by jeongminji on 4/18/25.
//

import SwiftUI

enum SpecialInfoType {
    case myInfo
    case otherInfo
}

struct SpecialInfoView: View {
    var messageType: SpecialInfoType
    var questions: [String]
    var answers: [String]? = nil
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Special info")
                .foregroundStyle(.blue900)
                .font(.pretendard(.medium, size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            switch messageType {
            case .myInfo:
                Text("상대와 나누고 싶은 대화나\n기억해줬으면 하는 내용을 질문으로 추가해주세요.")
                    .foregroundStyle(.gray400)
                    .font(.pretendard(.light, size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                QuestionView(questions: questions)
                
            case .otherInfo:
                Rectangle()
                    .foregroundStyle(.blue700)
                    .frame(width: .infinity, height: 1)
                
                if let answers = answers {
                    ForEach(0..<min(questions.count, answers.count), id: \.self) { index in
                        VStack(spacing: 20) {
                            ChatView(text: questions[index], messageType: .otherMessage)
                            ChatView(text: answers[index], messageType: .myMessage)
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Components

struct QuestionView: View {
    @State var questions: [String]
    
    var body: some View {
        LazyVStack(spacing: 0) {
            ForEach(questions.indices, id: \.self) { index in
                QuestionItemView(
                    question: questions[index],
                    isFirst: index == 0,
                    isLast: index == questions.count - 1,
                    onDelete: {
                        questions.remove(at: index)
                        
                    }
                )
                .id(UUID())
            }
        }
    }
}

struct QuestionItemView: View {
    var question: String
    var isFirst: Bool
    var isLast: Bool
    var onDelete: () -> Void
    
    @State private var offset: CGFloat = 0
    @State private var showDeleteButton: Bool = false
    @State private var isPressed = false

    let cellWidth: CGFloat = 60
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if showDeleteButton {
                Button(action: {
                        onDelete()
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 30)
                        .padding()
                        .frame(width: cellWidth)
                        .frame(maxHeight: .infinity)
                        .background(.red.opacity(0.9))
                }
                .transition(.move(edge: .trailing))
            }
            
            HStack {
                Text(question)
                    .font(.pretendard(.light, size: 15))
                    .foregroundStyle(.gray500)
                
                Spacer()
                
                Image(systemName: "chevron.forward")
                    .foregroundStyle(.gray500)
            }
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity)
            .background(isPressed ? .white.opacity(0.7) : .white.opacity(0.8))
            .offset(x: offset)
        }
        .frame(height: cellWidth)
        .onTapGesture {
            isPressed.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
            }
        }
        .simultaneousGesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.width < 0 {
                        withAnimation {
                            offset =  -cellWidth
                            showDeleteButton = true
                        }
                    } else if value.translation.width > 0 {
                        withAnimation {
                            offset = 0
                            showDeleteButton = false
                        }
                    }
                }
        )
        .clipShape(
            RoundedCorner(
                radius: 20,
                corners: (isFirst && isLast) ? .all : (isFirst ? .top : (isLast ? .bottom : []))
            )
        )
    }
}

// MARK: - Preview

#Preview {
    let questions = [
        "제 닉네임 유래는 무엇일까요?",
        "제 고향은 어디일까요?"
    ]
    
    let answers = [
        "안알려줌",
        "비밀이에요"
    ]
    
    SpecialInfoView(messageType: .myInfo, questions: questions)
        .padding()
        .background(.blue500)
        
    SpecialInfoView(
        messageType: .otherInfo,
        questions: questions,
        answers: answers
    )
        .padding()
        .background(.blue500)
}

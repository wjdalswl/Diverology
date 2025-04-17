//
//  NamedropView.swift
//  Diverology
//
//  Created by jeongminji on 4/18/25.
//

import SwiftUI

struct NamedropView: View {
    @State private var viewState: NameDropViewState = .basicInfo
    @State private var currentIndex: Int = 0
    @State private var selected: Position = .domain
    @State private var text: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    private var questions: [String] = [
        "제 닉네임 유래는 무엇일까요?",
        "제 고향은 어디일까요?",
        "제 목표는 무엇일까요?"
    ]
    
    var body: some View {
        VStack(spacing: 42) {
            if viewState != .basicInfo {
                Button(action: {
                    if viewState == .questions && currentIndex == 0 {
                        viewState = .positionInfo
                    } else if viewState == .positionInfo {
                        viewState = .basicInfo
                    } else {
                        currentIndex -= 1
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue800)
                }
                .padding(.leading, 20)
                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .leading)
            } else {
                CustomNavigationBar(showBackButton: false)
            }
            
            ProfileView(nickName: "My", type: .basic)
                .padding(.top, 8)
            
            VStack {
                switch viewState {
                case .basicInfo:
                    BasicInfoView(
                        position: nil,
                        phoneNum: "010-0000-0000",
                        githubId: "wjdalswl",
                        instaId: "@pqrqpin2274"
                    )
                    Spacer()
                case .positionInfo:
                    PositionInfoView(selected: $selected)
                case .questions:
                    QuizView(currentIndex: $currentIndex, text: $text, questions: questions)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .safeAreaInset(edge: .bottom) {
            TitleWithButtonView(
                titleText: currentIndex == questions.count - 1 ? "질문이 끝이 났어요\n명함 카드를 획득하세요" : viewState.titleText,
                buttonText:  currentIndex == questions.count - 1 ? "러너 등록" : viewState.buttonText
            ) {
                viewState.buttonAction(currentIndex: currentIndex, questionsCount: questions.count, updateIndex: { newIndex in
                    currentIndex = newIndex
                }, updateState: { newState in
                    viewState = newState
                })
            }
        }
        .padding(.horizontal, 20)
        .backgroundImage()
    }
}

// MARK: - Methods

extension NamedropView {
    private func getViewState(for index: Int) -> NameDropViewState {
        if index == 0 {
            return .basicInfo
        } else if index == 1 {
            return .positionInfo
        } else {
            return .questions
        }
    }
}

// MARK: - Components

struct NamedropFieldSection<Content: View>: View {
    let title: String
    let question: String
    let content: () -> Content
    
    init(title: String, question: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.question = question
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundStyle(.blue900)
                .font(.pretendard(.medium, size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(question)
                .foregroundStyle(.blue700)
                .font(.pretendard(.bold, size: 24))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 15)
            
            content()
            
            Spacer()
        }
    }
}

struct PositionInfoView: View {
    @Binding var selected: Position
    
    var body: some View {
        NamedropFieldSection(
            title: "",
            question: "해당 러너의 포지션은 무엇인가요?"
        ) {
            PositionButtonsList(selected: $selected)
        }
    }
}

struct QuizView: View {
    @Binding var currentIndex: Int
    @Binding var text: String
    
    var questions: [String]
    
    var body: some View {
        NamedropFieldSection(
            title: "Special info",
            question: questions[currentIndex]
        ) {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text("러너와 대화를 통해 답을 찾아주세요!\n음성 대화나 텍스트를 통해 답을 작성해주세요")
                        .padding(.init(horizontal: 10, top: 10))
                        .foregroundColor(.gray200)
                        .font(.pretendard(.regular, size: 15))
                        .lineSpacing(2)
                }
                
                TextEditor(text: $text)
                    .font(.pretendard(.regular, size: 15))
                    .lineSpacing(2)
                    .scrollContentBackground(.hidden)
            }
            .padding(.init(horizontal: 20, vertical: 20))
            .background(.white.opacity(0.8))
            .cornerRadius(20)
            .frame(minHeight: 103)
            .shadow(
                color: .gray400.opacity(0.1),
                radius: 10,
                x: 4,
                y: 4
            )
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    NamedropView()
}

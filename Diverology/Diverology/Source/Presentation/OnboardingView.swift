//
//  OnboardingView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var nickNameText: String = ""
    @State private var selected: Position = .domain
    @State private var githubText: String = ""
    @State private var instaText: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                Text("프로필을 등록 해주세요!")
                    .titleText()
                    .padding(.top, 43)
                
                ProfileImageSelector()
                
                FieldSection(title: "닉네임") {
                    CustomTextField(text: $nickNameText, placeholder: "ADA에서 사용하고 계신 닉네임을 입력해주세요.")
                    SubText("자동으로 모두 대문자로 등록 됩니다.")
                        .padding(.top, -4)
                }
                
                FieldSection(title: "지원 분야") {
                    HStack {
                        ForEach(Position.allCases.indices, id: \..self) { i in
                            PositionButton(
                                position: Position.allCases[i],
                                isSelected: selected == Position.allCases[i]
                            ) {
                                selected = Position.allCases[i]
                            }
                            if i != Position.allCases.count - 1 {
                                Spacer()
                            }
                        }
                    }
                }
                
                FieldSection(title: "깃허브") {
                    CustomTextField(
                        text: $githubText,
                        placeholder: "깃허브 아이디를 입력해주세요."
                    )
                }
                
                FieldSection(title: "인스타") {
                    CustomTextField(
                        text: $instaText,
                        placeholder: "인스타 아이디를 입력해주세요."
                    )
                }
            }
            .padding(.init(horizontal: 20, bottom: 10))
        }
        .safeAreaInset(edge: .bottom) {
            Button("완료") {
                print("클릭됨")
            }
            .basicButtonStyle(labelColor: .white, backgroundColor: .semanticBlue600)
            .padding(.horizontal, 20)
        }
        .backgroundImage()
    }
}

// MARK: - Components

struct SubText: View {
    let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(.blue700)
            .font(.pretendard(.light, size: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FieldSection<Content: View>: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .foregroundStyle(.blue700)
                .font(.pretendard(.medium, size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
            content()
        }
    }
}

struct ProfileImageSelector: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(.imgEmpty)
                .resizable()
                .witProfileStyle()

            Button {
                print("눌림")
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath")
            }
            .imageCircleButtonStyle()

        }
    }
}

// MARK: - Preview

#Preview {
    OnboardingView()
}

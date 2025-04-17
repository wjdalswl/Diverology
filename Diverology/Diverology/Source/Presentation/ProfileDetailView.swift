//
//  ProfileDetailView.swift
//  Diverology
//
//  Created by jeongminji on 4/18/25.
//

import SwiftUI

enum ProfileDetailViewType {
    case my
    case other
}

struct ProfileDetailView: View {
    var viewType: ProfileDetailViewType
    
    private let questions = [
        "제 닉네임 유래는 무엇일까요?",
        "제 고향은 어디일까요?",
        "제 목표는 무엇일까요?",
        "제 닉네임 유래는 무엇일까요?",
        "제 고향은 어디일까요?",
        "제 목표는 무엇일까요?"
    ]
    
    private let answers = [
        "안알려줌 안알려줌 안알려줌 안알려줌 안알려줌 안알려줌 안알려줌 안알려줌 안알려줌 안알려줌",
        "비밀이에요",
        "안알려줌",
        "비밀이에요 비밀이에요 비밀이에요 비밀이에요 비밀이에요 비밀이에요 비밀이에요 비밀이에요",
        "안알려줌 안알려줌 안알려줌",
        "비밀이에요 비밀이에요 비밀이에요"
    ]
    
    var body: some View {
        VStack {
            switch viewType {
            case .my:
                CustomNavigationBar(
                    showBackButton: false,
                    rightItem: AnyView(
                        Button(
                            action: { print("수정 눌림") }
                        ) {
                            Image(systemName: "square.and.pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23, height: 20)
                                .foregroundColor(.blue800)
                        }
                    )
                )
                
            case .other:
                CustomNavigationBar(showBackButton: true)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 43) {
                    ProfileView(nickName: "My", type: .basic)
                    
                    BasicInfoView(
                        position: .tech,
                        phoneNum: "010-0000-0000",
                        githubId: "wjdalswl",
                        instaId: "@pqrqpin2274"
                    )
                    
                    switch viewType {
                    case .my:
                        SpecialInfoView(
                            messageType: .myInfo,
                            questions: questions
                        )
                        
                    case .other:
                        SpecialInfoView(
                            messageType: .otherInfo,
                            questions: questions,
                            answers: answers
                        )
                    }
                }
                .padding(.init(horizontal: 20, bottom: 20))
            }
            .frame(maxHeight: .infinity)
        }
        .backgroundImage()
    }
}

#Preview {
    ProfileDetailView(viewType: .my)
}

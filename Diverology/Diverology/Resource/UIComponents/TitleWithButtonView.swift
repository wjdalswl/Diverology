//
//  TitleWithButtonView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct TitleWithButtonView: View {
    let titleText: String
    let buttonText: String
    let action: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 13) {
            Text(titleText)
                .foregroundStyle(.blue900)
                .font(.pretendard(.semiBold, size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)

            Button(buttonText) {
                action?()
            }
            .basicButtonStyle(labelColor: .white, backgroundColor: .semanticBlue600)
        }
    }
}

#Preview {
    TitleWithButtonView(
        titleText: "러너의 기본 정보를 확인하셨나요?\n이제 더 Deep하게 알아보러 가볼까요?",
        buttonText: "다음"
    ) {
        print("다음")
    }
    .padding(.bottom, 100)
    
    TitleWithButtonView(
        titleText: "질문이 끝이 났어요\n명함 카드를 획득하세요",
        buttonText: "러너등록"
    ) {
        print("러너등록")
    }
}

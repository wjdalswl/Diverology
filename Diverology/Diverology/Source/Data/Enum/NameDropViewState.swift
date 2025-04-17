//
//  NameDropViewState.swift
//  Diverology
//
//  Created by jeongminji on 4/18/25.
//

import SwiftUI

enum NameDropViewState {
    case basicInfo
    case positionInfo
    case questions
    
    var titleText: String {
        switch self {
        case .basicInfo:
            return "러너의 기본 정보를 확인하셨나요?\n이제 더 Deep하게 알아보러 가볼까요?"
        case .positionInfo:
            return "해당 러너의 포지션은 무엇인가요?"
        case .questions:
            return "\n"
        }
    }
    
    var buttonText: String {
        switch self {
        case .basicInfo, .positionInfo:
            return "다음"
        case .questions:
            return "다음"
        }
    }
    
    func buttonAction(currentIndex: Int, questionsCount: Int, updateIndex: @escaping (Int) -> Void, updateState: @escaping (NameDropViewState) -> Void) {
        switch self {
        case .basicInfo:
            updateState(.positionInfo)
            updateIndex(0)
        case .positionInfo:
            updateState(.questions)
            updateIndex(0)
        case .questions:
            if currentIndex < questionsCount - 1 {
                updateIndex(currentIndex + 1)
            } else {
                print("명함 카드 획득")
            }
        }
    }
}

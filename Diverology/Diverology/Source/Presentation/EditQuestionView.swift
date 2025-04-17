//
//  EditQuestionView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct EditQuestionView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                showBackButton: true,
                rightItem: AnyView(
                    Button{
                        print("저장 눌림")
                    } label: {
                        Text("저장")
                            .font(.pretendard(.bold, size: 20))
                            .foregroundColor(.blue800)
                    }
                )
            )
            
            TextEditor(text: $text)
                .padding(.horizontal, 20)
                .foregroundColor(.blue900)
                .font(.pretendard(.regular, size: 20))
                .lineSpacing(5)
                .scrollContentBackground(.hidden)
                .background(.clear)
        }
        .backgroundImage()
    }
}

#Preview {
    EditQuestionView()
}



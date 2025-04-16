//
//  CustomTextField.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    var image: Image? = nil
    
    var body: some View {
        HStack {
            if let image {
                image
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.blue900)
            }
            
            ZStack(alignment: .leading) {
                
                
                if text.isEmpty {
                    Text(placeholder)
                        .font(.pretendard(.light, size: 13))
                        .foregroundColor(.gray200)
                }
                
                TextField("", text: $text)
                    .font(.pretendard(.regular, size: 15))
                    .foregroundColor(.black)
            }
        }
        .padding(.init(horizontal: 11, vertical: 13))
        .background(.white.opacity(0.8))
        .cornerRadius(20)
        .shadow(
            color: .gray400.opacity(0.2),
            radius: 10,
            x: 0,
            y: 4
        )
    }
}

#Preview {
    @Previewable
    @State var inputText: String = ""
    
    CustomTextField(text: $inputText, placeholder: "글자를 입력해주세요.")
    CustomTextField(
        text: $inputText,
        placeholder: "검색어를 입력해주세요.",
        image: Image(systemName: "magnifyingglass")
    )
}

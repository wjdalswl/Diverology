//
//  CustomNavigationBar.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var showBackButton: Bool = true
    var showLogo: Bool = false
    var rightItem: AnyView? = nil

    var body: some View {
        HStack {
            if showBackButton {
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label:{
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue800)
                }
            }
            
            if showLogo {
                Text("Diverology")
                    .font(.newYork(size: 25))
                    .foregroundColor(.semanticBlue600)
            }
            
            Spacer()
            
            if let rightItem = rightItem {
                rightItem
            }
        }
        .frame(height: 44)
        .padding(.horizontal, 20)
        .background(.clear)
    }
}


#Preview {
    CustomNavigationBar(
        showBackButton: true,
        rightItem: AnyView(
            Button{
                print("삭제 눌림")
            } label: {
                Text("삭제")
                    .font(.pretendard(.bold, size: 20))
                    .foregroundColor(.blue800)
            }
        )
    )
    .background(.blue400)
    
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
    .background(.blue400)
    
    CustomNavigationBar(
        showBackButton: true
    )
    .background(.blue400)
    
    CustomNavigationBar(
        showBackButton: false,
        showLogo: true
    )
    .background(.blue400)
}

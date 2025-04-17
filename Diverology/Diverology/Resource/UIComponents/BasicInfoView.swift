//
//  BasicInfoView.swift
//  Diverology
//
//  Created by jeongminji on 4/16/25.
//

import SwiftUI

struct BasicInfoView: View {
    let position: Position?
    let phoneNum: String?
    let githubId: String?
    let instaId: String?
    
    var body: some View {
        let rows: [(label: String, value: String)] = [
            position.map { ("포지션", $0.rawValue) },
            phoneNum?.isEmpty == false ? ("전화번호", phoneNum!) : nil,
            githubId?.isEmpty == false ? ("깃허브", githubId!) : nil,
            instaId?.isEmpty == false ? ("인스타", instaId!) : nil
        ].compactMap { $0 }
        
        VStack(alignment: .leading, spacing: 17) {
            if !rows.isEmpty {
                Text("basic info")
                    .foregroundStyle(.blue900)
                    .font(.pretendard(.bold, size: 20))
                
                VStack(spacing: 11) {
                    ForEach(rows, id: \.label) { row in
                        InfoRow(label: row.label, value: row.value)
                    }
                }
            }
        }
    }
}

// MARK: - Components

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.blue700)
                .font(.pretendard(.regular, size: 15))
            Spacer()
            Text(value)
                .foregroundColor(.blue900)
                .font(.pretendard(.regular, size: 15))
        }
    }
}

#Preview {
    BasicInfoView(
        position: .tech,
        phoneNum: "010-0000-0000",
        githubId: "wjdalswl",
        instaId: "@pqrqpin2274"
    )
}

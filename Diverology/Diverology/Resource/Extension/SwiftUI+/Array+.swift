//
//  Array+.swift
//  Diverology
//
//  Created by jeongminji on 4/15/25.
//

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map { i in
            Array(self[i..<Swift.min(i + size, count)])
        }
    }
}

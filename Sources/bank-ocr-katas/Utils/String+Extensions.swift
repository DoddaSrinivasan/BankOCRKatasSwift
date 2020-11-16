//
//  String+Extensions.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

extension String {
    
    var lines: [String] { split(whereSeparator: \.isNewline).map { "\($0)" } }
    
    var nonEmptyLines: [String] {
        return lines
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        
    }
    
    func group(length: Int) -> [String] {
        guard length > 0 && length < count else { return [self] }
        return (0 ... (count - 1) / length).map { String(dropFirst($0 * length).prefix(length)) }
    }
    
}

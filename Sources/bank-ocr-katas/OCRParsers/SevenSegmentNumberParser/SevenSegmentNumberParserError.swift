//
//  SevenSegmentNumberParserError.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

enum SevenSegmentNumberParserError: Error {
    
    case invalidCharacters(index: Int)
    case invalidCharacter(row: Int, column: Int, character: Character)
    case nonMatchingDigit
    
}

extension SevenSegmentNumberParserError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .invalidCharacters(let index):
            return "Invalid characters for digit at index: \(index)"
        case .invalidCharacter(let row, let column, let character):
            return "Invalid Character: \(character) at row: \(row), column: \(column)"
        case .nonMatchingDigit:
            return "Not matching digit"
        }
    }
    
}

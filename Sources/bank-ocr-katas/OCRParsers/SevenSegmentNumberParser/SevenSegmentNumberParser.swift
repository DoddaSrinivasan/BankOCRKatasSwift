//
//  SevenSegmentNumberParser.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

class SevenSegmentNumberParser {
    
    private struct Constants {
        static let emptyCharacter = Character(" ")
        static let horizontalCharacter = Character("_")
        static let verticalCharacter = Character("|")
    }
    
    let topSegments: [[Character]]
    let middleSegments: [[Character]]
    let bottomSegments: [[Character]]
    
    init(line1: String, line2: String, line3: String) {
        self.topSegments = line1.group(length: 3).map { Array($0) }
        self.middleSegments = line2.group(length: 3).map { Array($0) }
        self.bottomSegments = line3.group(length: 3).map { Array($0) }
    }
    
    var number: SevenSegmentNumber {
        let numberOfDigits = [topSegments.count, middleSegments.count, bottomSegments.count].max() ?? 0
        do {
            let digits = try (0..<numberOfDigits).map { try digit(at: $0) }
            return .success(digits)
        } catch {
            return .failure(error)
        }
    }
    
}

private extension SevenSegmentNumberParser {
    
    func digit(at index: Int) throws -> SevenSegmentDigit {
        guard let topChars = topSegments.get(index: index),
              let middleChars = middleSegments.get(index: index),
              let bottomChars = bottomSegments.get(index: index) else {
            throw SevenSegmentNumberParserError.invalidCharacters(index: index)
        }
        
        let segments = try segmentsWith(topChars: topChars, middleChars: middleChars, bottomChars: bottomChars)
        let joined = segments.map { $0.rawValue.lowercased() }.sorted().joined()
        
        if let digit = SevenSegmentDigit(rawValue: joined) {
            return digit
        } else {
            throw SevenSegmentNumberParserError.nonMatchingDigit
        }
    }
    
    func segmentsWith(topChars: [Character], middleChars: [Character], bottomChars: [Character]) throws -> [SevenSegment.Segment] {
        let emptyChar = Character(" ")
        return [
            try segmentAt(row: .top, column: .leading, character: topChars.get(index: 0) ?? emptyChar),
            try segmentAt(row: .top, column: .centre, character: topChars.get(index: 1) ?? emptyChar),
            try segmentAt(row: .top, column: .trailing, character: topChars.get(index: 2) ?? emptyChar),
            
            try segmentAt(row: .middle, column: .leading, character: middleChars.get(index: 0) ?? emptyChar),
            try segmentAt(row: .middle, column: .centre, character: middleChars.get(index: 1) ?? emptyChar),
            try segmentAt(row: .middle, column: .trailing, character: middleChars.get(index: 2) ?? emptyChar),
            
            try segmentAt(row: .bottom, column: .leading, character: bottomChars.get(index: 0) ?? emptyChar),
            try segmentAt(row: .bottom, column: .centre, character: bottomChars.get(index: 1) ?? emptyChar),
            try segmentAt(row: .bottom, column: .trailing, character: bottomChars.get(index: 2) ?? emptyChar)
        ].compactMap { $0 }
    }
    
    func segmentAt(row: SevenSegment.Row, column: SevenSegment.Column, character: Character) throws -> SevenSegment.Segment? {
        switch (row, column, character) {
        case (_, _, Constants.emptyCharacter):
            return nil
            
        case (.top, .centre, Constants.horizontalCharacter):
            return .a
            
        case (.middle, .leading, Constants.verticalCharacter):
            return .f
        case (.middle, .centre, Constants.horizontalCharacter):
            return .g
        case (.middle, .trailing, Constants.verticalCharacter):
            return .b
            
        case (.bottom, .leading, Constants.verticalCharacter):
            return .e
        case (.bottom, .centre, Constants.horizontalCharacter):
            return .d
        case (.bottom, .trailing, Constants.verticalCharacter):
            return .c
            
        default:
            throw SevenSegmentNumberParserError.invalidCharacter(row: row.rawValue, column: column.rawValue, character: character)
        }
    }
    
}

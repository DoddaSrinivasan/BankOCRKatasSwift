//
//  SevenSegmentParser.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

class MultiLineSevenSegmentParser {
    
    func numbers(from text: String) -> [SevenSegmentNumber] {
        let nonEmptyLines = text.nonEmptyLines
        var sevenSegmentNumbers: [SevenSegmentNumber] = []
        let numberOfNumbers = nonEmptyLines.count / 3
        (0..<numberOfNumbers).forEach { i in
            let line1 = nonEmptyLines.get(index: i*3 + 0) ?? ""
            let line2 = nonEmptyLines.get(index: i*3 + 1) ?? ""
            let line3 = nonEmptyLines.get(index: i*3 + 2) ?? ""
            let parser = SevenSegmentNumberParser(line1: line1, line2: line2, line3: line3)
            sevenSegmentNumbers.append(parser.number)
        }
        
        return sevenSegmentNumbers
    }
    
}

//
//  SevenSegmentDigit.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

/*
 * Reference for values
 * https://en.wikipedia.org/wiki/Seven-segment_display
 *
 */

enum SevenSegmentDigit: String {
    
    case zero = "abcdef"
    case one = "bc"
    case two = "abdeg"
    case three = "abcdg"
    case four = "bcfg"
    case five = "acdfg"
    case six = "acdefg"
    case seven = "abc"
    case eight = "abcdefg"
    case nine = "abcdfg"
    
    var description: String {
        switch self {
        case .zero:
            return "0"
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        }
    }
    
}

extension Array where Element == SevenSegmentDigit {
    
    var description: String {
        return self.map { $0.description }.joined()
    }
    
}

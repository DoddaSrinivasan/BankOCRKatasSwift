//
//  SevenSegmentNumber.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

typealias SevenSegmentNumber = Result<[SevenSegmentDigit], Error>

extension SevenSegmentNumber {
    
    var description: String {
        switch self {
        case .success(let digits):
            return digits.description
        case .failure(let error):
            return (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
        }
    }
    
}

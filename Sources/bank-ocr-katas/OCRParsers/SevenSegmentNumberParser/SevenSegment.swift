//
//  SevenSegment.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

/*
 * Domain model inspired from
 * https://en.wikipedia.org/wiki/Seven-segment_display
 *
 */

class SevenSegment {
    
    enum Segment: String {
        
        case a
        case b
        case c
        case d
        case e
        case f
        case g
        
    }
    
    enum Row: Int {
        
        case top
        case middle
        case bottom
        
    }
    
    enum Column: Int {
        
        case leading
        case centre
        case trailing
        
    }
    
}

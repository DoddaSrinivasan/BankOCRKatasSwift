//
//  Array+Extension.swift
//  bank-ocr-katas
//
//  Created by Srinivasan Dodda on 16.11.20.
//

import Foundation

extension Array {
    
    func get(index: Int) -> Element? {
        guard index < count else {
            return nil
        }
        
        return self[index]
    }
    
}

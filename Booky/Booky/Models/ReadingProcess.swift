//
//  ReadingProcess.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import Foundation

struct ReadingProcess: Codable {
    
    let totalPages: Int
    var readPages: Int = 0
    var percentage: Float {
        Float(readPages) / Float(totalPages)
    }
    
}

//
//  BookIdentifier.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import Foundation

struct BookIdentifier: Codable {
    
    var uuid = UUID()
    let isbn: String
    
}

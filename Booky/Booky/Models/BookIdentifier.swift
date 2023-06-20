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

extension BookIdentifier: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(isbn)
    }
    
    static func == (lhs: BookIdentifier, rhs: BookIdentifier) -> Bool {
        lhs.isbn == rhs.isbn
    }
    
}

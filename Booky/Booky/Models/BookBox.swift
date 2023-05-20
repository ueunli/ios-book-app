//
//  BookBox.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct BookBox: Codable {
    
    let count: Int
    let books: [Book]
    
    enum CodingKeys: String, CodingKey {
        case books = "items"
        case count = "totalItems"
    }
    
}

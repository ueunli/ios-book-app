//
//  BookListDTO.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct BookListDTO: Codable {
    
    let count: Int
    let books: [BookDTO]
    
    enum CodingKeys: String, CodingKey {
        case books = "items"
        case count = "totalResults"
    }
    
}

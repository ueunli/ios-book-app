//
//  Book.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct Book: Codable, Hashable {
    
    let title: String
    let author: String
    let coverLink: String
    
    init(from dto: BookDTO) {
        self.title = dto.title
        self.author = dto.author.prefix(while: { $0 != "(" }).trimmingCharacters(in: .whitespaces)
        self.coverLink = dto.coverLink
    }
    
}

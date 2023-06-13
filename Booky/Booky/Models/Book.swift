//
//  Book.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

struct Book {
    
    let id: String
    let title: String
    let author: String
    let coverLink: String
    
    init(from dto: BookDTO) {
        self.id = dto.isbn13 ?? dto.isbn
        self.title = dto.title
        self.author = dto.author.prefix(while: { $0 != "(" }).trimmingCharacters(in: .whitespaces)
        self.coverLink = dto.coverLink
    }
    
}

extension Book: Hashable {
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
    
}

//
//  Book.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct Book {
    
    let id: String
    let title: String
    let author: String
    let coverLink: String
    var isLiked: Bool = false {
        didSet {
            isLiked ? saveAsBookMark() : removeFromBookMark()
        }
    }
    
    init(from dto: BookDTO) {
        self.id = dto.isbn13 ?? dto.isbn
        self.title = dto.title
        self.author = dto.author.prefix(while: { $0 != "(" }).trimmingCharacters(in: .whitespaces)
        self.coverLink = dto.coverLink
        
    }
    
    mutating func toggleHeart() {
        isLiked = !isLiked
    }
    
}

extension Book: Hashable {
    
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
    
}

extension Book: Codable {
    
    func saveAsBookMark() {
        let data = try? PropertyListEncoder().encode(self)
        var array = UserDefaults.standard.array(forKey: "Bookmarks")
        array?.append(data as Any)
        UserDefaults.standard.setValue(array, forKey: "Bookmarks")
    }
    
    func removeFromBookMark() {
        var array = UserDefaults.standard.array(forKey: "Bookmarks") as? [Book]
        guard let index = array?.firstIndex(where: { $0 == self }) else { return }
        array?.remove(at: index)
        UserDefaults.standard.setValue(array, forKey: "Bookmarks")
    }
    
}

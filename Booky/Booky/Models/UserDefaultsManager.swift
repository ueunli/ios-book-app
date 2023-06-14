//
//  UserDefaultsManager.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import Foundation

enum UserDefaultsManager {
    
    static var bookIDs: Set<String> = []
    static private let storage = UserDefaults.standard
    
    static func updateBook(_ book: UserBook) {
        bookIDs.update(with: book.id.isbn)
        let data = try? PropertyListEncoder().encode(book)
        storage.setValue(data, forKey: book.id.isbn)
    }
    
    static func removeBook(_ book: UserBook) {
        bookIDs.remove(book.id.isbn)
        storage.removeObject(forKey: book.id.isbn)
    }
    
    static func userBooks() -> [UserBook] {
        bookIDs.compactMap(userBook)
    }
    
    static func userBook(id: String) -> UserBook? {
        guard bookIDs.contains(id),
              let data = storage.data(forKey: id),
              let book = try? PropertyListDecoder().decode(UserBook.self, from: data) else { return nil }
        return book
    }
    
}

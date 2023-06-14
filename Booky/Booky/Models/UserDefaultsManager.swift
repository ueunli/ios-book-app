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
    
    static func updateBook(_ detail: BookDetail) {
        bookIDs.update(with: detail.id.isbn)
        let data = try? PropertyListEncoder().encode(detail)
        storage.setValue(data, forKey: detail.id.isbn)
    }
    
    static func removeBook(_ detail: BookDetail) {
        bookIDs.remove(detail.id.isbn)
        storage.removeObject(forKey: detail.id.isbn)
    }
    
}

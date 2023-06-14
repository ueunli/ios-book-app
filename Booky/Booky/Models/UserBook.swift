//
//  UserBook.swift
//  Booky
//
//  Created by J.E on 2023/06/14.
//

import Foundation

struct UserBook: Codable {
    
    let id: BookIdentifier
    var book: Book
    var bookDetail: BookDetail
    var userDetail: UserBookDetail
    var isBookmarked: Bool {
        get {
            userDetail.isBookmarked
        }
        set {
            switch newValue {
            case true: save()
            case false: remove()
            }
        }
    }
    
    init(from dto: BookDTO) {
        let isbn = dto.isbn13 ?? dto.isbn
        self.id = BookIdentifier(isbn: isbn)
        self.book = Book(from: dto)
        self.bookDetail = BookDetail(from: dto)
        self.userDetail = UserBookDetail(for: bookDetail)
    }
    
    private func save() {
        UserDefaultsManager.updateBook(self)
    }
    
    private func remove() {
        UserDefaultsManager.removeBook(self)
    }
    
}

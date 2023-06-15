//
//  UserBook.swift
//  Booky
//
//  Created by J.E on 2023/06/14.
//

import Foundation

class UserBook: Codable, UserBookDetailDelegate {
    
    let id: BookIdentifier
    var book: Book
    var bookDetail: BookDetail
    var userDetail: UserBookDetail //{
//        didSet {
//            switch userDetail.isBookmarked {
//            case true: save()
//            case false: remove()
//            }
//        }
//    }
    
    init(from dto: BookDTO) {
        let isbn = dto.isbn13 ?? dto.isbn
        self.id = BookIdentifier(isbn: isbn)
        self.book = Book(from: dto)
        self.bookDetail = BookDetail(from: dto)
        self.userDetail = UserBookDetail(for: bookDetail)
    }
    
    func save() {
        UserDefaultsManager.updateBook(self)
    }
    
    func remove() {
        UserDefaultsManager.removeBook(self)
    }
    
}

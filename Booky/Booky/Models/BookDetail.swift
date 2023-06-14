//
//  BookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct BookDetail: Codable, Hashable {
    
    let id: BookIdentifier
    let title: String
    let author: String
    let publisher: String
    let publishingDate: String
    let coverLink: String
    let category: BookCategory
    let description: String
    let authorDescription: [Author]?
    let previewImageLinks: [String]?
    let pageCount: Int
    let tableOfContents: String?
    
    init(from dto: BookDTO) {
        let isbn = dto.isbn13 ?? dto.isbn
        self.id = BookIdentifier(isbn: isbn)
        self.title = dto.title
        self.author = dto.author
        self.publisher = dto.publisher
        self.publishingDate = dto.publishingDate
        self.coverLink = dto.coverLink
        self.category = BookCategory(id: dto.categoryId)
        self.description = dto.description
        self.authorDescription = dto.detail.authors?.map {
            Author(profile: "\($0.name) (\($0.type))", description: $0.information)
        }
        self.previewImageLinks = dto.detail.previewImageLinks
        self.pageCount = dto.detail.pages ?? 1
        self.tableOfContents = dto.detail.tableOfContents
    }
    
}

extension BookDetail: UserBookDetailDelegate {
    
    func save() {
        UserDefaultsManager.updateBook(self)
    }
    
    func remove() {
        UserDefaultsManager.removeBook(self)
    }
    
}

//
//  BookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct BookDetail: Codable {

    let title: String
    let author: String
    let coverLink: String

    let publisher: String
    let publishingDate: String

    let category: BookCategory
    let description: String
    let authorDescription: [Author]?

    let pageCount: Int
    let previewImageLinks: [String]?
    let tableOfContents: String?
    
    init(from dto: BookDTO) {
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

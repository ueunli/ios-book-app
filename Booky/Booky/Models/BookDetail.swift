//
//  BookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

struct BookDetail {
    
    let id: String
    let title: String
    let author: String
    let publisher: String
    let publishingDate: String
    let coverLink: String
    let categoryName: String
    let description: String
    let authorDescription: [Author]?
    let previewImageLinks: [String]?
    let pageCount: Int
    
    init(from dto: BookDTO) {
        self.id = dto.isbn13 ?? dto.isbn
        self.title = dto.title
        self.author = dto.author
        self.publisher = dto.publisher
        self.publishingDate = dto.publishingDate
        self.coverLink = dto.coverLink
        self.categoryName = dto.categoryName
        self.description = dto.description
        self.authorDescription = dto.detail.authors?.map {
                Author(profile: "\($0.name) (\($0.type))", description: $0.information)
        }
        self.previewImageLinks = dto.detail.previewImageLinks
        self.pageCount = dto.detail.pages ?? 1
    }
    
}

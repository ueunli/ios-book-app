//
//  BookDTO.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct BookDTO: Codable {
    
    let title: String
    let author: String
    let publisher: String
    let publishingDate: String
    let description: String
    let isbn: String
    let isbn13: String
    let stockStatus: StockStatus
    let coverLink: String
    let categoryId: Int
    let categoryName: String
    let series: SeriesDTO?
    let isAdult: Bool?
    let ratings: Int
    let detail: BookDetailDTO
    
    enum CodingKeys: String, CodingKey {
        case title, author, publisher
        case publishingDate = "pubDate"
        case description, isbn, isbn13, stockStatus
        case coverLink = "cover"
        case categoryId, categoryName
        case series = "seriesInfo"
        case isAdult = "adult"
        case ratings = "customerReviewRank"
        case detail = "subInfo"
    }
    
}

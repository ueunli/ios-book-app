//
//  Detail.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Detail: Codable {
    
    let title: String
    let subtitle: String?
    let authors: [String]
    let language: String
    let categories: [String]?
    let publisher, publishedDate: String
    let description: String
    let pageCount: Int
    let averageRating: Double
    let ratingsCount: Int
    let maturityRating: Maturity
    let imageLinks: ImageLinks
    
    struct ImageLinks: Codable {
        let smallThumbnail, thumbnail: String?
        let small, medium, large: String?
    }
    
    enum Maturity: String, Codable {
        case mature = "MATURE"
        case notMature = "NOT_MATURE"
    }
    
}

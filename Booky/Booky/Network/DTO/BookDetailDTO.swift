//
//  BookDetailDTO.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct BookDetailDTO: Codable {
    
    let subTitle: String?
    let originalTitle: String?
    let pages: Int?
    let tableOfContents: String?
    let previewImageLinks: [String]?
    let authors: [AuthorDTO]?
    
    enum CodingKeys: String, CodingKey {
        case subTitle, originalTitle
        case pages = "itemPage"
        case tableOfContents = "toc"
        case previewImageLinks = "previewImgList"
        case authors
    }
    
}

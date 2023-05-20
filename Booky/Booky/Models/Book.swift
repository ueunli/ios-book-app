//
//  Book.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Book: Codable {
    
    let id: String
    let detail: Detail
    let sale: Sale
    let viewer: Viewer
    
    enum CodingKeys: String, CodingKey {
        case id
        case detail = "volumeInfo"
        case sale = "saleInfo"
        case viewer = "accessInfo"
    }
    
}

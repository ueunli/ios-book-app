//
//  Book.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Book: Codable {
    
    let kind, id: String
    let detail: Detail
    let sale: Sale
    let viewer: Viewer
    
    enum CodingKeys: String, CodingKey {
        case kind, id
        case detail = "volumeInfo"
        case sale = "saleInfo"
        case viewer = "accessInfo"
    }
    
}

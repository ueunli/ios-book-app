//
//  Viewer.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Viewer: Codable {
    
    let viewability: Access
    let webReaderLink: String
    
    enum Access: String, Codable {
        case all = "ALL_PAGES"
        case partial = "PARTIAL"
        case blocked = "NO_PAGES"
        case unknown = "UNKNOWN"
    }
    
}

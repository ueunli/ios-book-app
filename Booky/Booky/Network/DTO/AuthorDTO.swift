//
//  AuthorDTO.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct AuthorDTO: Codable {
    
    let name: String
    let type: String
    let information: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "authorName"
        case type = "authorType"
        case information = "authorInfo"
    }
    
}

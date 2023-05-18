//
//  Detail.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Detail: Codable {
    
    let title, subtitle: String
    let authors: [String]
    let publisher, publishedDate: String
    let description: String
    
}

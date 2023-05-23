//
//  SeriesDTO.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct SeriesDTO: Codable {
    
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "seriesId"
        case name = "seriesName"
    }
    
}

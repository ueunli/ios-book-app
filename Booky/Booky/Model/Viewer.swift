//
//  Viewer.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Viewer: Codable {
    
    let viewability: String
    let canEmbed: Bool
    let hasPDF: Bool
    let webReaderLink: String
    
    enum CodingKeys: String, CodingKey {
        case viewability, webReaderLink
        case canEmbed = "embeddable"
        case hasPDF = "pdf"
        
        enum SubCodingKeys: String, CodingKey {
            case isAvailable
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.viewability = try container.decode(String.self, forKey: .viewability)
        self.canEmbed = try container.decode(Bool.self, forKey: .canEmbed)
        self.webReaderLink = try container.decode(String.self, forKey: .webReaderLink)
        let nestedContainer = try container.nestedContainer(keyedBy: CodingKeys.SubCodingKeys.self, forKey: .hasPDF)
        self.hasPDF = try nestedContainer.decode(Bool.self, forKey: .isAvailable)
    }
    
}

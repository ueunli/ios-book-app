//
//  Sale.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

struct Sale: Codable {
    
    let saleability: SaleType
    let isEbook: Bool
    let buyLink: String
    
    enum SaleType: String, Codable {
        case free = "FREE"
        case forSale = "FOR_SALE"
        case notForSale = "NOT_FOR_SALE"
        case forPreOrder = "FOR_PREORDER"
    }
    
}

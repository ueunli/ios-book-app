//
//  StockStatus.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import Foundation

enum StockStatus: String, Codable {
    
    case hasStock = ""
    case outOfStock = "품절"
    case outOfPrint = "절판"
    case notPrinted = "미출간"
    case preOrdering = "예약판매"
    
}

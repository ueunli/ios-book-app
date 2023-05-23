//
//  BestSellerRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BestSellerRouter: RouterType {
    
    var scheme: String { "https" }
    var host: String { "www.aladin.co.kr" }
    var staticPath: [String] { ["ttb", "api"] }
    var optionPath: [String] = ["ItemList.aspx"]
    var staticQuery: [String: Any] {
        ["ttbkey": "",
         "version": 20131101,
         "Output": "JS",
         "Cover": "MidBig"]
    }
    
    var optionQuery: [String: Any] = [:]
    
}

extension BestSellerRouter {
    
    mutating func update(path: String = "ItemList.aspx") {
        updatePath(path)
    }
    
    mutating func update(queryType: String = "Bestseller",
                         searchTarget: String = "Book",
                         categoryId: Int = 0) {
        let newQuery: [String: Any] = ["QueryType": queryType, "SearchTarget": searchTarget, "CategoryId": categoryId]
        updateQuery(newQuery)
    }
    
}

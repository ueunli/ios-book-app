//
//  BestSellerRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BestSellerRouter: NetworkRouterType {
    
    var scheme: String { "https" }
    var host: String { "www.aladin.co.kr" }
    var staticPath: [String] { ["ttb", "api"] }
    var optionPath: [String] = ["ItemList.aspx"]
    var staticQuery: [String: Any] {
        ["ttbkey": Bundle.main.ttbKey(),
         "version": 20131101,
         "Output": "JS",
         "Cover": "MidBig"]
    }
    
    var optionQuery: [String: Any] = [:]
    
}

extension BestSellerRouter {
    
    mutating func update(path: String) {
        updatePath(path)
    }
    
    mutating func update(queryType: String = "Bestseller",
                         searchTarget: String = "Book",
                         category: BookCategory = .all) {
        let newQuery: [String: Any] = ["QueryType": queryType,
                                       "SearchTarget": searchTarget,
                                       "CategoryId": category.rawValue]
        updateQuery(newQuery)
    }
    
}

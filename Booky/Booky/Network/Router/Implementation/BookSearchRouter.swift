//
//  BookSearchRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BookSearchRouter: NetworkRouterType {
    
    var scheme: String { "https" }
    var host: String { "www.aladin.co.kr" }
    var staticPath: [String] { ["ttb", "api"] }
    var optionPath: [String] = ["ItemSearch.aspx"]
    var staticQuery: [String: Any] {
        ["ttbkey": Bundle.main.ttbKey(),
         "version": 20131101,
         "Output": "JS",
         "Cover": "MidBig"]
    }

    var optionQuery: [String: Any] = [:]
    
}

extension BookSearchRouter {
    
    mutating func update(path: String) {
        updatePath(path)
    }
    
    mutating func update(queryType: String = "Title",
                         query: String,
                         category: BookCategory = .all,
                         sort: String = "Accuracy") {
        let newQuery: [String: Any] = ["QueryType": queryType,
                                       "Query": query,
                                       "CategoryId": category.rawValue,
                                       "Sort": sort]
        updateQuery(newQuery)
    }
    
}

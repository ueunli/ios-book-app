//
//  BookSearchRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BookSearchRouter: RouterType {
    
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
    
    mutating func update(path: String = "ItemSearch.aspx") {
        updatePath(path)
    }
    
    mutating func update(queryType: String = "Title",
                         query: String,
                         sort: String = "Accuracy") {
        let newQuery = ["QueryType": queryType, "Query": query, "Sort": sort]
        updateQuery(newQuery)
    }
    
}

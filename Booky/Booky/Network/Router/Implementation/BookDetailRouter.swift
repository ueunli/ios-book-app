//
//  BookDetailRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BookDetailRouter: NetworkRouterType {
    
    var scheme: String { "https" }
    var host: String { "www.aladin.co.kr" }
    var staticPath: [String] { ["ttb", "api"] }
    var optionPath: [String] = ["ItemLookUp.aspx"]
    var staticQuery: [String: Any] {
        ["ttbkey": Bundle.main.ttbKey(),
         "version": 20131101,
         "Output": "JS",
         "Cover": "Big",
         "OptResult": "authors,toc,previewImgList"]
    }

    var optionQuery: [String: Any] = [:]
    
}

extension BookDetailRouter {
    
    mutating func update(path: String) {
        updatePath(path)
    }
    
    mutating func update(itemId: String) {
        let newQuery = ["ItemId": itemId]
        updateQuery(newQuery)
    }
    
}

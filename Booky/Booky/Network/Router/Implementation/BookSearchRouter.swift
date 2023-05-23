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
        ["ttbkey": "",
         "version": 20131101,
         "Output": "JS",
         "Cover": "MidBig"]
    }
    //TODO: - Sort, CategoryId, QueryType 사용자 정의
    var optionQuery: [String: Any] = ["QueryType": "Title", "Query": ""]
    
}

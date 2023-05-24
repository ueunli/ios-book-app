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
        ["ttbkey": Bundle.main.ttbKey(),
         "version": 20131101,
         "Output": "JS",
         "Cover": "MidBig",
         "QueryType": "Bestseller",
         "SearchTarget": "Book"]
    }
    //TODO: - CategoryId 사용자 정의, (+ QueryType을 optionQuery로 하여 주목받는 신간 뷰 구현)
    var optionQuery: [String: Any] = ["CategoryId": 0]

}

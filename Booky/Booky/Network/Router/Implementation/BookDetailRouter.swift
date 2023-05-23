//
//  BookDetailRouter.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

struct BookDetailRouter: RouterType {

    var scheme: String { "https" }
    var host: String { "www.aladin.co.kr" }
    var staticPath: [String] { ["ttb", "api"] }
    var optionPath: [String] = ["ItemLookUp.aspx"]
    var staticQuery: [String: Any] {
        ["ttbkey": "",
         "version": 20131101,
         "Output": "JS",
         "Cover": "Big",
         "OptResult": "authors,toc,previewImgList"]
    }
    //TODO: - (+ phraseList, reviewList의 표시 여부를 사용자 정의)
    var optionQuery: [String: Any] = ["ItemId": ""]

}

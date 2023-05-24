//
//  Bundle+.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Foundation

extension Bundle {
    
    func ttbKey() -> String {
        guard let url = self.url(forResource: "Info", withExtension: "plist"),
              let dictionary = NSDictionary(contentsOf: url),
              let value = dictionary["AladinAPIKey"] as? String else { return "" }
        return value
    }
    
}

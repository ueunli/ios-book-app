//
//  BookyDataSource.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import Foundation

enum BookyDataSource {
    
    case book(Book)
    case category(BookCategory)
    
}

extension BookyDataSource: Hashable {
    
    static func == (lhs: BookyDataSource, rhs: BookyDataSource) -> Bool {
        switch (lhs, rhs) {
        case (.book(let lBook), .book(let rBook)):
            return lBook == rBook
        case (.category(let lCategory), .category(let rCategory)):
            return lCategory == rCategory
        case (.category(_), .book(_)):
            return false
        case (.book(_), .category(_)):
            return false
        }
    }
    
}

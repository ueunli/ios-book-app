//
//  CellSize.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import Foundation

enum CellSize {
    case small, medium, big
    
    var cgSize: CGSize {
        switch self {
        case .small:
            return .init(width: 100, height: 146)
        case .medium:
            return .init(width: 128, height: 180)
        case .big:
            return .init(width: 160, height: 220)
        }
    }
}

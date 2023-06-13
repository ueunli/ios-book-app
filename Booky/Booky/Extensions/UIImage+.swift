//
//  UIImage+.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import UIKit

extension UIImage {
    
    static let searchIcon = UIImage(named: "search")
    static let starsIcon = UIImage(named: "stars")
    
    static let homeIcon = UIImage(systemName: "house")?
        .withBaselineOffset(fromBottom: 5)
        .applyingSymbolConfiguration(
            .init(pointSize: 25, weight: .medium, scale: .small)
        )
    static let starIcon = UIImage(systemName: "star")?
        .withBaselineOffset(fromBottom: 5)
        .applyingSymbolConfiguration(
            .init(pointSize: 25, weight: .medium, scale: .small)
        )
    
    static let favoriteStarIcon = UIImage(systemName: "star.fill")?
        .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    static let notFavoriteStarIcon = UIImage(systemName: "star")?
        .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    
    static let rightChevronArrow = UIImage(systemName: "chevron.forward")?
        .withTintColor(.Black.dark2, renderingMode: .alwaysOriginal)
    static let leftChevronArrow = UIImage(systemName: "chevron.backward")?
        .withTintColor(.Black.dark2, renderingMode: .alwaysOriginal)
    
}

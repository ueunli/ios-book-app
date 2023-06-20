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
    static let favoriteIcon = UIImage(systemName: "star")?
        .withBaselineOffset(fromBottom: 5)
        .applyingSymbolConfiguration(
            .init(pointSize: 25, weight: .medium, scale: .small)
        )
    
    static let emptyStarIcon = UIImage(systemName: "star")?
        .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    static let coloredStarIcon = UIImage(systemName: "star.fill")?
        .withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
    
    static let emptyHeartIcon = UIImage(systemName: "heart")?
        .withTintColor(.Purple.magenta, renderingMode: .alwaysOriginal)
    static let coloredHeartIcon = UIImage(systemName: "heart.fill")?
        .withTintColor(.Purple.magenta, renderingMode: .alwaysOriginal)
    
    static let rightChevronArrow = UIImage(systemName: "chevron.forward")?
        .withTintColor(.Black.dark2, renderingMode: .alwaysOriginal)
    static let leftChevronArrow = UIImage(systemName: "chevron.backward")?
        .withTintColor(.Black.dark2, renderingMode: .alwaysOriginal)
    
}

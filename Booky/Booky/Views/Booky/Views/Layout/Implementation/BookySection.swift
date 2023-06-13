//
//  BookySection.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit

enum BookySection: CaseIterable {
    
    case bestSeller
    case category
    case shelf
    
}

extension BookySection: LayoutRouterType {
    
    var columns: Int {
        switch self {
        case .bestSeller:
            return 1
        case .category:
            return 2
        case .shelf:
            return 3
        }
    }
    
    var item: NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemEdge
        return item
    }
    
    var itemSize: NSCollectionLayoutSize {
        switch self {
        case .bestSeller, .category, .shelf:
            return .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        }
    }
    
    var itemEdge: NSDirectionalEdgeInsets {
        switch self {
        case .bestSeller:
            return .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        case .category:
            return .init(top: 3, leading: 5, bottom: 3, trailing: 5)
        case .shelf:
            return .init(top: 0, leading: 9, bottom: 10, trailing: 9)
        }
    }
    
    var headerItem: NSCollectionLayoutBoundarySupplementaryItem {
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        header.pinToVisibleBounds = true
        return header
    }
    
    var headerSize: NSCollectionLayoutSize {
        .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(47))
    }
    
    var group: NSCollectionLayoutGroup {
        switch self {
        case .bestSeller, .category, .shelf:
            return .horizontal(layoutSize: groupSize, subitem: item, count: columns)
        }
    }
    
    var groupSize: NSCollectionLayoutSize {
        switch self {
        case .bestSeller:
            return .init(widthDimension: .absolute(128), heightDimension: .absolute(214))
        case .category:
            return .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(60))
        case .shelf:
            return .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(181))
        }
    }
    
    var section: NSCollectionLayoutSection {
        switch self {
        case .bestSeller:
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [headerItem]
            section.contentInsets = sectionEdge
            section.interGroupSpacing = spacing
            section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            return section
        case .category:
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [headerItem]
            section.contentInsets = sectionEdge
            section.interGroupSpacing = spacing
            section.orthogonalScrollingBehavior = .none
            return section
        case .shelf:
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = sectionEdge
            section.interGroupSpacing = spacing
            section.orthogonalScrollingBehavior = .none
            return section
        }
    }
    
    var spacing: CGFloat {
        switch self {
        case .bestSeller:
            return 16
        case .category:
            return 5
        case .shelf:
            return 10
        }
    }
    
    var sectionEdge: NSDirectionalEdgeInsets {
        switch self {
        case .bestSeller:
            return .init(top: 10, leading: 15, bottom: 20, trailing: 15)
        case .category:
            return .init(top: 10, leading: 5, bottom: 25, trailing: 5)
        case .shelf:
            return .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        }
    }
    
    var configuration: UICollectionViewCompositionalLayoutConfiguration {
        switch self {
        case .bestSeller:
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.scrollDirection = .horizontal
            return config
        case .category, .shelf:
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.scrollDirection = .vertical
            return config
        }
    }
    
    func createLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        Self.allCases[sectionIndex].section
    }

}

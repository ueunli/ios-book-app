//
//  LayoutRouterType.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit

protocol LayoutRouterType {
    
    var columns: Int { get }
    
    var item: NSCollectionLayoutItem { get }
    var itemSize: NSCollectionLayoutSize { get }
    var itemEdge: NSDirectionalEdgeInsets { get }
    
    var headerItem: NSCollectionLayoutBoundarySupplementaryItem { get }
    var headerSize: NSCollectionLayoutSize { get }
    
    var group: NSCollectionLayoutGroup { get }
    var groupSize: NSCollectionLayoutSize { get }

    var section: NSCollectionLayoutSection { get }
    var spacing: CGFloat { get }
    var sectionEdge: NSDirectionalEdgeInsets { get }
    
    var layout: UICollectionViewCompositionalLayout { get }
    var configuration: UICollectionViewCompositionalLayoutConfiguration { get }
    
    func createLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?
    
}

extension LayoutRouterType {

    var layout: UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: createLayout, configuration: configuration)
        return layout
    }
    
}

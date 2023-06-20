//
//  DashboardViewController.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import UIKit

final class DashboardViewController: UIViewController {
    
    //MARK: - Property
    
    private let searchBar = UISearchBar()
    private var searchRouter = BookSearchRouter()
    
    private var bookListRouter = BestSellerRouter()
    private var books = [UserBook]()
    
    private var bookSearchRouter = BookSearchRouter()
    private var categories = [BookCategory]()
    
    private var dataSource: UICollectionViewDiffableDataSource<BookySection, BookyDataSource>!
    private var snapshot: NSDiffableDataSourceSnapshot = {
        var snapshot = NSDiffableDataSourceSnapshot<BookySection, BookyDataSource>()
        snapshot.appendSections(BookySection.allCases)
        return snapshot
    }()
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: createLayout)
        )
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

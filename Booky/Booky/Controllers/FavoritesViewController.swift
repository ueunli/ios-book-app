//
//  FavoritesViewController.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    //MARK: - Property
    
    private var books = [UserBook]() {
        didSet {
            let oldIdentifiers = oldValue.map { BookyDataSource.book($0.book) }
            snapshot.deleteItems(oldIdentifiers)
            applyBookDataSource()
        }
    }
    
    private var dataSource: UICollectionViewDiffableDataSource<BookySection, BookyDataSource>!
    private var snapshot: NSDiffableDataSourceSnapshot = {
        var snapshot = NSDiffableDataSourceSnapshot<BookySection, BookyDataSource>()
        snapshot.appendSections([.shelf])
        return snapshot
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: createLayout, configuration: BookySection.shelf.configuration)
        )
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        return view
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        configureRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateBooks()
    }
    
    //MARK: - Configuring Method
    
    private func configureBackgroundViewDesign() {
        view.backgroundColor = .White.pure
    }
    
    private func configureRefreshControl() {
        let refreshControl = UIRefreshControl(frame: view.frame)
        refreshControl.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    private func configureCollectionView() {
        configureCollectionViewAutoLayout()
        configureCollectionViewDesign()
        
        collectionView.delegate = self
    }
    
    private func configureCollectionViewAutoLayout() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureCollectionViewDesign() {
        collectionView.backgroundColor = .White.pure
    }
    
    private func createLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        BookySection.shelf.section
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<BookCell, Book> { cell, indexPath, item in
            cell.update(book: item)
            cell.configure(alignment: .left, titleLines: 2)
        }
        
        dataSource = UICollectionViewDiffableDataSource<BookySection, BookyDataSource>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard case let .book(book) = itemIdentifier else { return nil }
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: book)
            return cell
        }
    }
    
    //MARK: - Updating Method
    
    @objc
    private func refreshCollectionView() {
        if collectionView.refreshControl?.isRefreshing ?? false {
            collectionView.refreshControl?.endRefreshing()
        }
        updateBooks()
    }
    
    private func updateBooks() {
        books = UserDefaultsManager.userBooks()
    }
    
    private func applyBookDataSource() {
        let bookItems = books.map { BookyDataSource.book($0.book) }
        snapshot.appendItems(bookItems, toSection: .shelf)
        dataSource.apply(snapshot)
    }
    
}

extension FavoritesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, performPrimaryActionForItemAt indexPath: IndexPath) {
        guard books.count > 0 else { return }
        let book = books[indexPath.row % books.count]
        moveToDetailView(for: book)
    }
    
    private func moveToDetailView(for book: UserBook) {
        let viewController = BookDetailViewController()
        viewController.book = book
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

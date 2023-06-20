//
//  SearchViewController.swift
//  Booky
//
//  Created by J.E on 2023/05/18.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Property
    
    var searchRange: BookCategory = .all
    
    let searchBar = UISearchBar()
    private var searchRouter = BookSearchRouter()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: createLayout)
        )
        view.showsVerticalScrollIndicator = false
        view.isDirectionalLockEnabled = true
        return view
    }()
    
    var searchResults = [UserBook]()
    var dataSource: UICollectionViewDiffableDataSource<BookySection, BookyDataSource>!
    private var snapshot: NSDiffableDataSourceSnapshot = {
        var snapshot = NSDiffableDataSourceSnapshot<BookySection, BookyDataSource>()
        snapshot.appendSections([.shelf])
        return snapshot
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroudViewDesign()
        configureSearchBar()
        configureNavigationBar()
        configureCollectionView()
        configureDataSource()
    }
    
    //MARK: - Configuring Method (for view)
    
    private func configureBackgroudViewDesign() {
        view.backgroundColor = .White.pure
    }
    
    //MARK: - Configuring Method (for navigationBar)
    
    private func configureNavigationBar() {
        navigationItem.setLeftBarButton(
            .init(image: .leftChevronArrow,
                  style: .plain,
                  target: self,
                  action: #selector(backToForward)),
            animated: true)
        navigationItem.setRightBarButton(
            .init(image: .searchIcon,
                  style: .plain,
                  target: self,
                  action: #selector(searchBooks)),
            animated: true)
        
        navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem?.tintColor = .Black.dark2
        navigationItem.rightBarButtonItem?.tintColor = .Purple.accent
    }
    
    private func configureSearchBar() {
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.searchTextField.background = UIImage()
        searchBar.searchTextField.backgroundColor = .clear
        searchBar.searchTextField.disabledBackground = UIImage()
        
        searchBar.autocorrectionType = .no
        searchBar.autocapitalizationType = .none
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.placeholder = "찾을 " + "제목" + "을(를) 입력하세요."
        
        searchBar.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.endEditing(true)
    }
    
    //MARK: - Configuring Method (for collectionView)
    
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
        view.backgroundColor = .clear
    }
    
    private func createLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        BookySection.shelf.section
    }
    
    //MARK: - Configuring Method (for dataSource)

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
    private func searchBooks(max: Int = 30) {
        guard let input = searchBar.text else { return }
        searchRouter.update(query: input, category: searchRange)
        searchRouter.optionQuery.updateValue(30, forKey: "MaxResults")
        searchRouter.fetchBooks { dto in
            self.searchResults = (dto?.books ?? []).map { UserBook(from: $0) }
            self.applyDataSource()
        }
    }
    
    private func applyDataSource() {
        let items = searchResults.map { BookyDataSource.book($0.book) }
        snapshot.appendItems(items, toSection: .shelf)
        dataSource.apply(snapshot)
    }
    
    @objc
    private func backToForward() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBooks()
    }
    
}

extension SearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, performPrimaryActionForItemAt indexPath: IndexPath) {
        let book = searchResults[indexPath.row % searchResults.count]
        moveToDetailView(for: book)
    }
    
    private func moveToDetailView(for book: UserBook) {
        let viewController = BookDetailViewController()
        viewController.book = book
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

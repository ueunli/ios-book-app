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
    private var books = [Book]()
    
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
        view.addSubview(collectionView)
        configureSearchBar()
        configureCollectionView()
        configureDataSource()
        animateInitialView()
        configureBackgroundViewDesign()
        collectionView.delegate = self
        updateCategories()
        updateBestSeller(for: .all)
    }
    
    //MARK: - Configuration Method (for view)
    
    private func configureBackgroundViewDesign() {
        let baseLayer = CALayer()
        let accentLayer = CALayer()
        let gradientLayer = CALayer()
        
        baseLayer.backgroundColor = UIColor.White.pure.cgColor
        baseLayer.zPosition = -3
        baseLayer.frame = view.safeAreaLayoutGuide.layoutFrame
        view.layer.addSublayer(baseLayer)
        
        accentLayer.backgroundColor = UIColor.Purple.accent.cgColor
        accentLayer.frame = .init(x: 0, y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height * 0.4)
        accentLayer.zPosition = -2
        baseLayer.addSublayer(accentLayer)
        
        gradientLayer.backgroundColor = UIColor(patternImage: UIImage(named: "gradient") ?? UIImage()).cgColor
        gradientLayer.frame = .init(x: 0, y: 50, width: view.frame.width, height: 90)
        gradientLayer.zPosition = -1
        accentLayer.addSublayer(gradientLayer)
    }
    
    private func configureNavigationBarDesign() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func animateInitialView() {
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut) {
            self.collectionView.transform = CGAffineTransform(translationX: 0, y: -50)
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut) {
            self.searchBar.transform = CGAffineTransform(translationX: 0, y: 10)
        }
    }
    
    //MARK: - Configuring Method (for searchBar)
    
    private func configureSearchBar() {
        configureSearchBarDesign()
        configureSearchBarAutuLayout()

        searchBar.delegate = self
        searchBar.autocorrectionType = .no
        searchBar.autocapitalizationType = .none
        searchBar.enablesReturnKeyAutomatically = true
    }
    
    private func configureSearchBarAutuLayout() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(collectionView)
            make.top.equalToSuperview().offset(70)
        }
    }
    
    private func configureSearchBarDesign() {
        searchBar.setImage(UIImage(), for: .search, state: .normal)
        searchBar.showsBookmarkButton = true
        searchBar.setImage(.searchIcon, for: .clear, state: .normal)
        searchBar.setImage(.searchIcon, for: .bookmark, state: .normal)
        
        searchBar.layer.backgroundColor = UIColor.White.pure.cgColor
        searchBar.layer.cornerRadius = 20
        searchBar.layer.masksToBounds = true
        searchBar.layer.frame = searchBar.bounds
        searchBar.layer.frame.origin.y -= 10
        searchBar.layer.frame.size.height += 10
        
        searchBar.searchTextField.disabledBackground = UIImage()
        searchBar.searchTextField.background = UIImage()
        searchBar.searchTextField.backgroundColor = .clear
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         searchBar.endEditing(true)
    }
    
    //MARK: - Configuring Method (for collectionView)
    
    private func configureCollectionView() {
        configureCollectionViewDesign()
        configureCollectionViewAutoLayout()
    }
    
    private func configureCollectionViewAutoLayout() {
        collectionView.snp.makeConstraints { make in
            make.directionalHorizontalEdges.equalToSuperview().inset(20)
            make.top.equalTo(searchBar.snp.bottom).offset(80)
            make.bottom.equalToSuperview().offset(-40)
        }
    }
    
    private func configureCollectionViewDesign() {
        collectionView.layer.cornerRadius = 15
        collectionView.backgroundColor = .White.pure
    }
    
    private func createLayout(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? {
        BookySection.allCases[sectionIndex].section
    }
    
    //MARK: - Configuring Method (for dataSource)
    
    private func configureDataSource() {
        configureCollectionViewHeaderRegistration()
        configureCollectionViewCellRegistration()
    }
    
    private func configureCollectionViewHeaderRegistration() {
        let headerRegistration = UICollectionView.SupplementaryRegistration<HeaderView>(elementKind: UICollectionView.elementKindSectionHeader) { _, _, _ in
        }
        dataSource.supplementaryViewProvider = { collectionView, elementKind, indexPath in
            let header = collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
            header.section = BookySection.allCases[indexPath.section]
            return header
        }
    }
    
    private func configureCollectionViewCellRegistration() {
        let bestSellerBookCellRegistration = UICollectionView.CellRegistration<BestSellerBookCell, Book> { cell, indexPath, item in
            cell.update(book: item)
        }
        let bookCellRegistration = UICollectionView.CellRegistration<CategoryCell, BookCategory> { cell, indexPath, item in
            cell.update(category: item)
        }
        dataSource = UICollectionViewDiffableDataSource<BookySection, BookyDataSource>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            switch itemIdentifier {
            case .book(let book):
                let cell = collectionView.dequeueConfiguredReusableCell(using: bestSellerBookCellRegistration, for: indexPath, item: book)
                return cell
            case .category(let category):
                let cell = collectionView.dequeueConfiguredReusableCell(using: bookCellRegistration, for: indexPath, item: category)
                return cell
            }
        }
    }
    
    //MARK: - Updating Method
    
    private func updateBestSeller(for category: BookCategory) {
        bookListRouter.update(category: category)
        bookListRouter.fetchBooks { dto in
            self.books = (dto?.books ?? []).map { Book(from: $0) }
            self.applyBookDataSource()
        }
    }
    
    private func updateCategories() {
        categories = BookCategory.allCases
        applyCategoryDataSource()
    }
    
    private func applyBookDataSource() {
        let items = books.map { BookyDataSource.book($0) }
        snapshot.appendItems(items, toSection: .bestSeller)
        dataSource.apply(snapshot)
    }
    
    private func applyCategoryDataSource() {
        let items = categories.map { BookyDataSource.category($0) }
        snapshot.appendItems(items, toSection: .category)
        dataSource.apply(snapshot)
    }
    
}

extension DashboardViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, performPrimaryActionForItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
            let category = cell.category
            moveToSearchView(for: category)
        } else {
            let book = books[indexPath.row % books.count]
            moveToDetailView(for: book.id.isbn)
        }
    }
    
    private func moveToSearchView(for category: BookCategory) {
        let viewController = SearchViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func moveToDetailView(for bookId: String) {
        let viewController = BookDetailViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension DashboardViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let viewController = SearchViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

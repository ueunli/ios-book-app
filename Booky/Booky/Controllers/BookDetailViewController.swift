//
//  BookDetailViewController.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import SnapKit
import Kingfisher

class BookDetailViewController: UIViewController {
    
    var book: UserBook!
    var detailRouter = BookDetailRouter()
    
    let scrollView = UIScrollView()
    
    //MARK: - Property (bookProfileStackView)
    
    let bookProfileStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 4
        view.layer.shadowColor = UIColor.Black.dark2.withAlphaComponent(0.5).cgColor
        view.layer.shadowOffset = view.frame.size
        view.layer.shadowOpacity = 0.7
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .regular)
        label.textColor = .White.light2
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.textColor = .White.light2.withAlphaComponent(0.6)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .Black.light
        return label
    }()
    
    lazy var coverView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow.withAlphaComponent(0.5)
        view.contentMode = .center
        return view
    }()
    
    lazy var previewButton: UIButton = {
        let button = UIButton()
        button.setTitle("미리보기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .medium)
        button.titleLabel?.textColor = .White.pure
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.Black.dark2.withAlphaComponent(0.5).cgColor
        button.layer.shadowOffset = button.frame.size
        button.layer.shadowOpacity = 0.7
        button.layer.backgroundColor = UIColor.Purple.accent.cgColor
        return button
    }()
    
    //MARK: - Property (bookDetailStackView)

    let bookDetailStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 10
        return view
    }()
    
    lazy var summaryTextView: InformationTextView = {
        let view = InformationTextView()
        view.titleLabel.text = "줄거리"
        return view
    }()
    
    lazy var authorProfileView: InformationTextView = {
        let view = InformationTextView()
        view.titleLabel.text = "저자소개"
        return view
    }()
    
    lazy var memoView: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 15
        field.backgroundColor = .Purple.mild
        field.placeholder = "이책에 대한 메모를 남겨주세요!"
        field.font = .systemFont(ofSize: 12, weight: .regular)
        field.tintColor = .Black.light
        field.textColor = .Black.medium
        return field
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBook()
        print("나는 ", book.userDetail.isLiked)
        navigationItem.setLeftBarButton(.init(image: .leftChevronArrow?.withTintColor(.White.pure),
                                              style: .plain,
                                              target: self,
                                              action: #selector(backToForwardView)),
                                        animated: true)
        navigationItem.setRightBarButton(.init(image: book.userDetail.isLiked ? .coloredStarIcon : .emptyStarIcon,
                                               style: .plain,
                                               target: self,
                                               action: #selector(toggleStar)),
                                         animated: true)
        
        configureBackgroundDesign()
        configureViewHierarchy()
        configureAutoLayout()
    }
    
    func configureViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(bookProfileStackView)
        scrollView.addSubview(bookDetailStackView)
        
        scrollView.addSubview(titleLabel)
        bookProfileStackView.addArrangedSubview(authorLabel)
        bookProfileStackView.addArrangedSubview(coverView)
        bookProfileStackView.addArrangedSubview(infoLabel)
        scrollView.addSubview(previewButton)
        
        bookDetailStackView.addArrangedSubview(summaryTextView)
        bookDetailStackView.addArrangedSubview(authorProfileView)
        bookDetailStackView.addArrangedSubview(memoView)
    }
    
    func configureAutoLayout() {
        configureScrollViewLayout()
        configureStackView1Layout()
        configureStackView2Layout()
    }
    
    func configureScrollViewLayout() {
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(26)
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.8)
        }
        bookProfileStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.centerX.equalToSuperview()
            make.bottom.equalTo(previewButton.snp.top).offset(-20)
        }
        previewButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.93)
            make.height.equalTo(50)
        }
        bookDetailStackView.snp.makeConstraints { make in
            make.top.equalTo(previewButton.snp.bottom).offset(24)
            make.bottom.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.93)
        }
    }
    
    func configureStackView1Layout() {
        authorLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.5)
        }
        coverView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        infoLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.bottom.equalToSuperview()
        }
    }
    
    func configureStackView2Layout() {
        summaryTextView.snp.makeConstraints { make in
            make.top.width.centerX.equalToSuperview()
        }
        authorProfileView.snp.makeConstraints { make in
            make.width.centerX.equalToSuperview()
        }
        memoView.snp.makeConstraints { make in
            make.bottom.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(116)
        }
    }
    
    func configureBackgroundDesign() {
        let baseLayer = CALayer()
        let accentLayer = CALayer()
        let gradientLayer = CAGradientLayer.lightPurpleLinear
        
        baseLayer.backgroundColor = UIColor.White.pure.cgColor
        baseLayer.zPosition = -3
        baseLayer.frame = view.safeAreaLayoutGuide.layoutFrame
        view.layer.addSublayer(baseLayer)
        
        accentLayer.backgroundColor = UIColor.Purple.accent.cgColor
        accentLayer.frame = .init(x: view.frame.minX, y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height * 0.4)
        accentLayer.zPosition = -2
        accentLayer.masksToBounds = true
        baseLayer.addSublayer(accentLayer)
        
        gradientLayer.frame = .init(x: view.frame.midX - 116, y: 170, width: 232, height: 232)
        gradientLayer.cornerRadius = 115
        gradientLayer.zPosition = -1
        accentLayer.addSublayer(gradientLayer)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @objc
    private func backToForwardView() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func toggleStar() {
        book.userDetail.toggleHeart()
        navigationItem.rightBarButtonItem?.image = book.userDetail.isLiked ? .coloredStarIcon : .emptyStarIcon
    }
    
    func updateBook() {
        if book == nil {
            loadNewBook()
        }
        updateDetails()
    }
    
    func updateDetails() {
        guard let detail = book?.bookDetail else { return }
        titleLabel.text = detail.title
        authorLabel.text = book.bookDetail.author
        infoLabel.text = "\(detail.publisher)/\(detail.publishingDate)/\(detail.category.name)"
        summaryTextView.textView.text = detail.description
        authorProfileView.textView.text = detail.authorDescription?[0].description
        KF.fetchAndRenderImage(from: detail.coverLink, as: .big, to: coverView)
    }
    
    func loadNewBook() {
        detailRouter.update(itemId: book.id.isbn)
        detailRouter.fetchBooks { dto in
            guard let book = dto?.books.first else { return }
            self.book = UserBook(from: book)
            self.updateDetails()
        }
    }

}

extension BookDetailViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        let newNote = textField.text
        UserDefaults.standard.set(newNote, forKey: book.id.isbn)
    }
    
}

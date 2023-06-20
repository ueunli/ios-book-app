//
//  BookCell.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import SnapKit
import Kingfisher

class BookCell: UICollectionViewCell {
    
    //MARK: - Property
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var coverView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViewHierarchy()
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViewHierarchy()
        configureAutoLayout()
    }
    
    //MARK: - Method
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        coverView.image = nil
    }
    
    func update(book: Book) {
        titleLabel.text = book.title
        KF.fetchAndRenderImage(from: book.coverLink,
                               as: .small,
                               to: coverView)
    }
    
    func configure(alignment: NSTextAlignment, titleLines: Int? = nil) {
        titleLabel.textAlignment = alignment
        if let titleLines {
            titleLabel.numberOfLines = titleLines
        }
    }
    
    func configureViewHierarchy() {
        self.addSubview(coverView)
        self.addSubview(titleLabel)
    }
    
    func configureAutoLayout() {
        coverView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        titleLabel.invalidateIntrinsicContentSize()
        titleLabel.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(coverView.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
    }
    
}

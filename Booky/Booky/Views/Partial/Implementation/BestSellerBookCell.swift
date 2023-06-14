//
//  BestSellerBookCell.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import SnapKit
import Kingfisher

final class BestSellerBookCell: BookCell {
    
    //MARK: - Property
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .Black.medium
        return label
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
        authorLabel.text = nil
    }
    
    override func update(book: Book) {
        super.update(book: book)
        authorLabel.text = book.author
    }
    
    override func configure(alignment: NSTextAlignment, titleLines: Int? = nil) {
        super.configure(alignment: alignment, titleLines: titleLines)
        authorLabel.textAlignment = alignment
    }
    
    override func configureViewHierarchy() {
        super.configureViewHierarchy()
        addSubview(authorLabel)
    }
    
    override func configureAutoLayout() {
        coverView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-4)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(authorLabel.snp.top).offset(-2)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
}

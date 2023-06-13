//
//  CategoryCell.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {
    
    //MARK: - Property
    
    var category: BookCategory = .all
    
    lazy var gradient = {
        let layer = CAGradientLayer.purpleLinear
        layer.frame = self.bounds
        return layer
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .center
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        return label
    }()
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .White.medium3
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .White.medium3
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    //MARK: - Method
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
    
    func update(category: BookCategory) {
        self.category = category
        nameLabel.text = category.name
    }

    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
        if state.isSelected {
            layer.insertSublayer(gradient, at: 0)
            nameLabel.textColor = .White.pure
        } else if !state.isFocused {
            gradient.isHidden = true
            nameLabel.textColor = .Black.pure
        }
    }
    
}

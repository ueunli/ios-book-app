//
//  InformationTextView.swift
//  Booky
//
//  Created by J.E on 2023/06/15.
//

import UIKit
import SnapKit

final class InformationTextView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .Black.pure
        label.textAlignment = .left
        self.addSubview(label)
        return label
    }()
    
    lazy var textView: UITextView = {
        let view = UITextView()
        view.font = .systemFont(ofSize: 12, weight: .regular)
        view.textColor = .Black.medium
        view.textAlignment = .natural
        view.backgroundColor = .White.pure.withAlphaComponent(0.45)
        view.layer.cornerRadius = 3
        view.textContainer.maximumNumberOfLines = 0
        view.isScrollEnabled = false
        view.isSelectable = false
        self.addSubview(view)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureAutoLayout()
    }
    
    private func configureAutoLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.bottom.equalTo(textView.snp.top)
        }
        textView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}

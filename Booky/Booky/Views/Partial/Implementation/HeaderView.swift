//
//  HeaderView.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import SnapKit

final class HeaderView: UICollectionReusableView {
    
    //MARK: - Property
    
    var section: BookySection? {
        get {
            nil
        }
        set {
            label.text = newValue?.headerTitle
            icon.image = newValue?.headerIcon
            button.isHidden = newValue != .bestSeller
        }
    }
    
    private lazy var label = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.textColor = .black
        self.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.centerY.equalTo(button)
        }
        return label
    }()
    
    private lazy var icon = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        self.addSubview(view)
        view.snp.makeConstraints { make in
            make.centerY.equalTo(label)
            make.leading.equalTo(label.snp.trailing).offset(7)
        }
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .detailDisclosure)
        button.setImage(.rightChevronArrow, for: .normal)
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.equalTo(13)
            make.height.equalTo(18)
        }
        button.addAction(.init(handler: { _ in
            print("다음 화면으로 이동")
        }), for: .touchUpInside)
        return button
    }()

    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addGradient()
    }
    
    //MARK: - Method
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor,
                           UIColor.white.withAlphaComponent(0.9).cgColor,
                           UIColor.white.withAlphaComponent(0.5).cgColor,
                           UIColor.white.withAlphaComponent(0).cgColor]
        gradientLayer.locations = [0.6, 0.88, 0.93, 0.98]
        gradientLayer.frame = bounds
        gradientLayer.frame.size.width += 30
        gradientLayer.frame.size.height += 13
        gradientLayer.frame.origin.x -= 15
        layer.addSublayer(gradientLayer)
    }
    
}

//MARK: - Extension for Constants

fileprivate extension BookySection {
    
    var headerTitle: String {
        switch self {
        case .bestSeller:
            return "지금 가장 인기있는 도서"
        case .category:
            return "  장르별 찾기"
        default:
            return ""
        }
    }
    
    var headerIcon: UIImage? {
        switch self {
        case .bestSeller:
            return .starsIcon
        case .category:
            return .searchIcon
        default:
            return nil
        }
    }
 
}

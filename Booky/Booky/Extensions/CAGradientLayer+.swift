//
//  CAGradientLayer+.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import UIKit

extension CAGradientLayer {
    
    //MARK: 카테고리 버튼
    static let purpleLinear = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.Purple.accent.cgColor,
                        UIColor.Purple.vivid1.cgColor]
        return layer
    }()
    
    //MARK: 홈화면 배경포인트
    static let lightPurpleLinear = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.Purple.medium.withAlphaComponent(0.385).cgColor,
                        UIColor.Purple.vivid2.withAlphaComponent(0).cgColor]
        return layer
    }()
    
    //MARK: 도서상세 표지 배경포인트
    static let mildPurpleLinear = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.Purple.medium.withAlphaComponent(0.28).cgColor,
                        UIColor.White.medium3.withAlphaComponent(0).cgColor]
        return layer
    }()
    
}

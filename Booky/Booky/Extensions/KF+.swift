//
//  KF+.swift
//  Booky
//
//  Created by J.E on 2023/06/13.
//

import UIKit
import Kingfisher

extension KF {
    
    static func fetchAndRenderImage(from urlString: String, as size: CellSize, to view: UIImageView) {
        let url = URL(string: urlString)
        let builder = Self.url(url)
            .resizing(referenceSize: size.cgSize)
            .transition(.fade(0.2))
        
        builder.set(to: view)
    }
    
}

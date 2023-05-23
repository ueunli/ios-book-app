//
//  RouterType.swift
//  Booky
//
//  Created by J.E on 2023/05/23.
//

import Alamofire
import Kingfisher
import Foundation

protocol RouterType {
    
    var scheme: String { get }
    var host: String { get }
    var staticPath: [String] { get }
    var optionPath: [String] { get set }
    var staticQuery: [String: Any] { get }
    var optionQuery: [String: Any] { get set }
    
}

extension RouterType {
    
    static private var defaultComponents: URLComponents {
        URLComponents()
    }
    
    private var urlComponents: URLComponents {
        var components = Self.defaultComponents
        components.scheme = scheme
        components.host = host
        components.path = "/" + (staticPath + optionPath).joined(separator: "/")
        components.queryItems = staticQuery.map { URLQueryItem(name: $0.0, value: "\($0.1)") }
        components.queryItems?.append(contentsOf: optionQuery.map { URLQueryItem(name: $0.0, value: "\($0.1)") })
        return components
    }
    
    mutating func updatePath(_ newPaths: String...) {
        for newPath in newPaths {
            guard !optionPath.contains(newPath) else { continue }
            optionPath.append(newPath)
        }
    }
    
    mutating func updateQuery(_ newQueries: [String: Any]) {
        newQueries.forEach {
            optionQuery.updateValue($0.0, forKey: "\($0.1)")
        }
    }
    
}

extension RouterType {
    
    func fetchBookList(_ completion: @escaping (BookListDTO?) -> Void) {
        let request = AF.request(urlComponents)
        request.responseDecodable(of: BookListDTO.self) { response in
            let data = response.value
            completion(data)
        }
    }
    
    func fetchBookCover(from link: String, _ completion: @escaping (KFImage) -> Void) {
        let url = URL(string: link)
        let kfImage = KFImage(url)
        completion(kfImage)
    }
    
}

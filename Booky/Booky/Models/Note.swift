//
//  Note.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct Note: Codable {
    
    var type: NoteType
    var title: String
    var body: String
    
    init(type: NoteType,
         title: String = Date(timeIntervalSinceNow: 0).description,
         body: String = "") {
        self.type = type
        self.title = title
        self.body = body
    }
    
}

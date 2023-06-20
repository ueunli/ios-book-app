//
//  UserBookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct UserBookDetail: Codable {
    
    private(set) var notes: [Note] = []
    private(set) var isLiked: Bool = false
    private(set) var process: ReadingProcess
    var isBookmarked: Bool {
        !notes.isEmpty || isLiked || !process.percentage.isZero
    }
    
    init(for book: BookDetail) {
        self.process = ReadingProcess(totalPages: book.pageCount)
    }

    enum CodingKeys: String, CodingKey {
        case notes, isLiked, process
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(notes, forKey: .notes)
        try container.encode(isLiked, forKey: .isLiked)
        try container.encode(process, forKey: .process)
    }
    
    func note(at index: Int) -> Note? {
        guard index < notes.count else { return nil }
        return notes[index]
    }
    
    mutating func toggleHeart() {
        isLiked = !isLiked
    }
    
    mutating func editNote(at index: Int, with newNote: Note) {
        notes[index] = newNote
    }
    
    mutating func updatePages(_ newReadPages: Int) {
        process.readPages = newReadPages
    }
    
}

//
//  UserBookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

protocol UserBookDetailDelegate {
    
    func save()
    func remove()
    
}

struct UserBookDetail: Codable {
    
    //MARK: - Property
    
    private(set) var notes: [Note] = []
    private(set) var isLiked: Bool = false
    private(set) var process: ReadingProcess
    var isBookmarked: Bool {
        get {
            !notes.isEmpty && isLiked && !process.percentage.isZero
        }
        set {
            switch newValue {
            case true: delegate?.save()
            case false: delegate?.remove()
            }
        }
    }
    
    var delegate: UserBookDetailDelegate?
    
    //MARK: - Life Cycle
    
    init(for book: BookDetail) {
        self.process = ReadingProcess(totalPages: book.pageCount)
        self.delegate = book
    }
    
    //MARK: - Codable Method
    
    enum CodingKeys: String, CodingKey {
        case notes, isLiked, process
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(notes, forKey: .notes)
        try container.encode(isLiked, forKey: .isLiked)
        try container.encode(process, forKey: .process)
    }
    
    //MARK: - Public Method
    
    mutating func toggleHeart() {
        isLiked = !isLiked
    }
    
    func note(at index: Int) throws -> Note {
        guard index < notes.count else {
            fatalError("해당 인덱스의 노트가 존재하지 않습니다.")
        }
        return notes[index]
    }
    
    mutating func editNote(at index: Int, with newNote: Note) {
        notes[index] = newNote
    }
    
    mutating func updatePages(_ newReadPages: Int) {
        process.readPages = newReadPages
    }
    
}

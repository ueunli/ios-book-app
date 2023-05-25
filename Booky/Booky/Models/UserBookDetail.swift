//
//  UserBookDetail.swift
//  Booky
//
//  Created by J.E on 2023/05/24.
//

import Foundation

struct UserBookDetail {
    
    //MARK: - Property
    
    private(set) var id: String
    private(set) var notes: [Note] = []
    private(set) var isLiked: Bool = false
    private(set) var totalPages: Int
    private(set) var readPages: Int = 0
    var process: Float {
        Float(readPages) / Float(totalPages)
    }
    
    //MARK: - Life Cycle
    
    init(for book: BookDetail) {
        self.id = book.id
        self.totalPages = book.pageCount
        UserDefaults.standard.register(defaults: [id: UserBookDetail.self])
    }
    
    //MARK: - Get·Mutating Method
    
    mutating func toggleHeart() {
        isLiked = !isLiked
    }
    
    func note(at index: Int) throws -> Note {
        guard index < notes.count else {
            fatalError("해당 인덱스에는 노트가 존재하지 않습니다.")    //TODO: 유저활동 혹은 인덱스 관련 에러 정의
        }
        return notes[index]
    }
    
    mutating func editNote(at index: Int, with newNote: Note) {
        notes[index] = newNote
    }
    
    mutating func updatePages(_ newReadPages: Int) {
        readPages = newReadPages
    }
    
    
    //MARK: - Storing Method
    
    func save() {
        UserDefaults.standard.set(self, forKey: id)
    }
    
    func remove() {    //TODO: notes, isLiked, readPages 중 어디에도 활동기록이 없다면 자동으로 remove되는 기능
        UserDefaults.standard.removeObject(forKey: id)
    }
    
}

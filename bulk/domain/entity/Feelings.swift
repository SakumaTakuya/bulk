//
//  Feelings.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
final class Feelings {
    let difficulty: Difficulty
    let remarks: String
    
    @Relationship(inverse: \Record.feelings)
    var records: [Record] = []
    
    init(difficulty: Difficulty, remarks: String) {
        self.difficulty = difficulty
        self.remarks = remarks
    }
}

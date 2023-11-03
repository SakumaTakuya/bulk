//
//  Feelings.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
class Feelings {
    let difficulty: Difficulty
    let remarks: String
    
    init(difficulty: Difficulty, remarks: String) {
        self.difficulty = difficulty
        self.remarks = remarks
    }
}

enum Difficulty: String, Codable {
    case hard = "hard"
    case normal = "normal"
    case easy = "easy"
}

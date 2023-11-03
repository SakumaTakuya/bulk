//
//  Menu.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
class Menu {
    @Attribute(.unique)
    let name: String
    let part: BodyPart
    let recordables: [Recordable]
    
    init(name: String, part: BodyPart, recordables: [Recordable]) {
        self.name = name
        self.part = part
        self.recordables = recordables
    }
}


enum Recordable: String, Codable {
    case rest = "rest"
    case time = "time"
    case reps = "reps"
    case weight = "weight"
}

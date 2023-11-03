//
//  Menu.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
class Menu {
    let name: String
    let part: BodyPart
    let type: MenuType
    
    init(name: String, part: BodyPart, type: MenuType) {
        self.name = name
        self.part = part
        self.type = type
    }
}

enum MenuType: String, Codable {
    case time = "time"
    case weight = "weight"
}

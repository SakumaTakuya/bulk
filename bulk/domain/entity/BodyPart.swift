//
//  BodyPart.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
final class BodyPart {
    let name: String
    
    @Relationship(inverse: \Menu.part)
    var menus: [Menu] = []

    
    init(_ name: String) {
        self.name = name
    }
}

extension BodyPart: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

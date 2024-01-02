//
//  Menu.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
final class Menu {
    @Attribute(.unique)
    let name: String
    let recordables: [Recordable]
    
    var part: BodyPart? = nil
    
    @Relationship(inverse: \Record.menu)
    var records: [Record] = []
    
    init(name: String, recordables: [Recordable]) {
        self.name = name
        self.recordables = recordables
    }
}

//
//  BodyPart.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
class BodyPart {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
}

//
//  Condition.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
final class Condition {
    let staus: Status
    // その日に行った同じ部位の種目数
    let events: Int
    
    init(staus: Status, events: Int) {
        self.staus = staus
        self.events = events
    }
}


enum Status: String, Codable {
    case excellent = "excellent"
    case good = "good"
    case poor = "poor"
}

//
//  Record.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import Foundation
import SwiftData

@Model
final class Record {
    let menu: Menu
    let sets: [Workout]
    let feelings: Feelings
    let date: Date
    
    init(menu: Menu, sets: [Workout], feelings: Feelings, date: Date) {
        self.menu = menu
        self.sets = sets
        self.feelings = feelings
        self.date = date
    }
}

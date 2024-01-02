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
    let sets: [Workout]
    let date: Date
    
    var menu: Menu? = nil
    var feelings: Feelings? = nil
    
    init(sets: [Workout], date: Date) {
        self.sets = sets
        self.date = date
    }
}

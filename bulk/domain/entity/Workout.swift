//
//  Workout.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftData

@Model
class Workout {
    let restSec: Int
    let timeSec: Int
    let reps: Int
    let weight: Float
    
    init(restSec: Int, timeSec: Int, reps: Int, weight: Float) {
        self.restSec = restSec
        self.timeSec = timeSec
        self.reps = reps
        self.weight = weight
    }
}

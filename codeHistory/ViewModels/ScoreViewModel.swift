//
//  ScoreViewModel.swift
//  Code History
//
//  Created by Adam Esiyok on 8/5/23.
//

import Foundation

struct ScoreViewModel {
    let correctGuesses: Int
    let incorrectGuesses: Int
    
    var percentage: Int {
        (correctGuesses * 100 / (correctGuesses + incorrectGuesses))
    }
}

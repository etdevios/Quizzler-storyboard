//
//  Question.swift
//  Quizzler
//
//  Created by Eduard Tokarev on 20.02.2023.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], c: String) {
        text = q
        answers = a
        correctAnswer = c
    }
}

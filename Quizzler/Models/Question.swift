//
//  Question.swift
//  Quizzler
//
//  Created by Eduard Tokarev on 20.02.2023.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}

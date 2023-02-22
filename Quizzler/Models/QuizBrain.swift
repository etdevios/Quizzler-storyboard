//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Eduard Tokarev on 20.02.2023.
//

import Foundation

struct QuizBrain {
    private let quiz: [Question] = [
        .init(q: "A slug's blood is green.", a: "True"),
        .init(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        .init(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        .init(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        .init(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        .init(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        .init(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        .init(q: "Google was originally called 'Backrub'.", a: "True"),
        .init(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        .init(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        .init(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        .init(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    private var questionNumber = 0
    private var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> String {
        String(score)
    }
}

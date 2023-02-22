//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Eduard Tokarev on 20.02.2023.
//

import Foundation

struct QuizBrain {
    private let quiz: [Question] = [
        .init(
            q: "Which is the largest organ in the human body?",
            a: ["Heart", "Skin", "Large Intestine"],
            c: "Skin"
        ),
        .init(
            q: "Five dollars is worth how many nickels?",
            a: ["25", "50", "100"],
            c: "100"
        ),
        .init(
            q: "What do the letters in the GMT time zone stand for?",
            a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"],
            c: "Greenwich Mean Time"
        ),
        .init(
            q: "What is the French word for 'hat'?",
            a: ["Chapeau", "Écharpe", "Bonnet"],
            c: "Chapeau"
        ),
        .init(
            q: "In past times, what would a gentleman keep in his fob pocket?",
            a: ["Notebook", "Handkerchief", "Watch"],
            c: "Watch"
        ),
        .init(
            q: "How would one say goodbye in Spanish?",
            a: ["Au Revoir", "Adiós", "Salir"],
            c: "Adiós"
        ),
        .init(
            q: "Which of these colours is NOT featured in the logo for Google?",
            a: ["Green", "Orange", "Blue"],
            c: "Orange"
        ),
        .init(
            q: "What alcoholic drink is made from molasses?",
            a: ["Rum", "Whisky", "Gin"],
            c: "Rum"
        ),
        .init(
            q: "What type of animal was Harambe?",
            a: ["Panda", "Gorilla", "Crocodile"],
            c: "Gorilla"
        ),
        .init(
            q: "Where is Tasmania located?",
            a: ["Indonesia", "Australia", "Scotland"],
            c: "Australia"
        )
    ]
    
    private var questionNumber = 0
    private var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].correctAnswer {
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
    
    func getAnswers() -> [String] {
        quiz[questionNumber].answers
    }
}

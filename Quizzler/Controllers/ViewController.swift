//
//  ViewController.swift
//  Quizzler
//
//  Created by Eduard Tokarev on 19.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    //TODO: сделать кнопки через массив
    @IBOutlet private weak var choice1: UIButton!
    @IBOutlet private weak var choice2: UIButton!
    @IBOutlet private weak var choice3: UIButton!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    private var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        var userGotItRight = true
        if let userAnswer = sender.currentTitle {
            userGotItRight = quizBrain.checkAnswer(userAnswer)
        }
        
        if userGotItRight {
            setABoundaryAndColor(for: sender)
            sender.backgroundColor = .green
        } else {
            setABoundaryAndColor(for: sender)
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        setABoundaryAndCornerRadius(for: choice1)
        setABoundaryAndCornerRadius(for: choice2)
        setABoundaryAndCornerRadius(for: choice3)
        
        choice1.backgroundColor = .clear
        choice2.backgroundColor = .clear
        choice3.backgroundColor = .clear
        
        let answerChoices = quizBrain.getAnswers().shuffled()
        
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
    private func setABoundaryAndColor(for sender: UIButton) {
        sender.layer.borderColor = #colorLiteral(red: 0.2736934423, green: 0.3937450051, blue: 0.5647235513, alpha: 1)
        sender.layer.borderWidth = 6
    }
    
    private func setABoundaryAndCornerRadius(for button: UIButton) {
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0
    }
}


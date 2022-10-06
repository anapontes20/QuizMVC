//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: IBOUTLET
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    //MARK: IBACTION
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       
            if userGotItRight {
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
                
            }
           // })
        
        //"questionNumber =  questionNumber + 1" é a versao mais longa de "question += 1"

        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUi), userInfo: nil, repeats: false)
        
        
        //tambem pode usar esse codigo - Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { _ in

    }
    // ao colocar o codigo scheduledtimer o update fica como objc
    @objc func updateUi () {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
      
        
        
    }
    
}


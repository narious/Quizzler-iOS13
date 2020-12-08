//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opt1: UIButton!
    @IBOutlet weak var opt2: UIButton!
    @IBOutlet weak var opt3: UIButton!
    @IBOutlet weak var opt4: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var quizBrain = QuestionBrain();
    var optionButtons : [UIButton] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        optionButtons = [opt1, opt2, opt3, opt4]
        // Sets the allignment for buttons to be on the left
        for button in optionButtons {
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        }
        progressBar.progress = quizBrain.fractionCompleted()
        if quizBrain.hasNext() {
            updateUI()
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if quizBrain.isCorrect(selectedAnswer: sender.currentTitle!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        progressBar.progress = quizBrain.fractionCompleted()
        
        if quizBrain.hasNext() {
            updateUI()
        } else {
            questionText.text = "Buzzer sound.. !"
            Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(resetUI), userInfo: nil, repeats: false)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    func populateButtons() {
        assert (quizBrain.currentQuestion().options.count == 4, "Question doesn't have enough options in populate button")
        for index in 0...3 {
            optionButtons[index].setTitle(quizBrain.getCurrentQuestionOptions()[index], for: .normal)
        }
    }
    
    @objc func resetUI() {
        quizBrain.reset()
        progressBar.progress = quizBrain.fractionCompleted()
        updateUI()
        
    }
    
    func updateUI() {
        quizBrain.next()
        questionText.text = quizBrain.getCurrentQuestionText()
        score.text = "Score: \(quizBrain.correctAnswers)"
        populateButtons()
    }
    
}


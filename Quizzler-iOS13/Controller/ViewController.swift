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
    @IBOutlet weak var progressBar: UIProgressView!
    var questionsPack = QuestionPack();
    var optionButtons : [UIButton] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        optionButtons = [opt1, opt2, opt3, opt4]
        // Sets the allignment for buttons to be on the left
        for button in optionButtons {
            button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        }
        progressBar.progress = questionsPack.fractionCompleted()
        if questionsPack.hasNext() {
            updateUI(q: questionsPack.next())
        }
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print(questionsPack.currentQuestion().correctAnswer)
        print(sender.currentTitle!)
        if sender.currentTitle == questionsPack.currentQuestion().correctAnswer {
            sender.backgroundColor = UIColor.green
            correctAnswers += 1
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        progressBar.progress = questionsPack.fractionCompleted()
        if questionsPack.hasNext() {
            updateUI(q: questionsPack.next())
        } else {
            questionText.text = "Buzzer sound.. !"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.backgroundColor = UIColor.clear
        }
    }
    
    func populateButtons(q: Question) {
        assert (q.options.count == 4, "Question doesn't have enough options in populate button \(q.options)")
        for index in 0...3 {
            optionButtons[index].setTitle(q.options[index], for: .normal)
        }
    }
    
    func updateUI(q: Question) {
        questionText.text = q.question
        populateButtons(q: q)
    }
    
}


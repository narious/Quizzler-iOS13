//
//  QuestionPack.swift
//  Quizzler-iOS13
//
//  Created by Michael on 6/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class QuestionBrain {
    let questions : [Question];
    var questionNumber = 0;
    var correctAnswers : Int = 0;
    
    init() {
        self.questions =
        [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine", "None"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100", "None"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "None"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet", "None"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch", "None"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir", "None"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue", "None"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin", "None"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile", "None"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland", "None"], correctAnswer: "Australia")]

    }
    
    func getNumber(n : Int) -> Question {
        assert(n < questions.count)
        return self.questions[n]
    }
    
    func hasNext() -> Bool {
        if questionNumber >= self.questions.count {
            return false
        }
        return true
    }
    
    func next() -> Question {
        assert(hasNext(), "Question Pack has run out of questions!")
        questionNumber += 1
        return self.getNumber(n: questionNumber - 1)
    }
    
    func reset() {
        questionNumber = 0
    }
    
    func currentQuestion() -> Question {
        assert(self.questionNumber != 0, "Next needs to be called atleast once, i.e. to init")
        return self.getNumber(n: questionNumber - 1)
    }
    
    func fractionCompleted() -> Float {
        return Float(questionNumber + 1) / Float(self.questions.count)
    }
    
    func isCorrect(selectedAnswer: String) -> Bool {
        let q = currentQuestion()
        if selectedAnswer == q.correctAnswer {
            return true
        }
        return false
    }
    
    func getCurrentQuestionOptions() -> [String] {
        return self.currentQuestion().options
    }
    
    func getCurrentQuestionText() -> String {
        return self.currentQuestion().question
    }
}

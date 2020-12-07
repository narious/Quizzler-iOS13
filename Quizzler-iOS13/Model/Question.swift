//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Michael on 6/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question : String;
    let options: [String];
    let correctAnswer : String;
    
    init(q: String, a: [String], correctAnswer: String) {
        self.question = q
        self.options = a
        self.correctAnswer = correctAnswer
    }
    
    
}

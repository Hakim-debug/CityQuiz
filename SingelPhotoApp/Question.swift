//
//  Question.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-01-16.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//

import Foundation
//Kapslar in Frågorna i en class
class Question {
    
    var quest : String
    var answer : String
    var Answer1 : String
    var Answer2 : String
    var Answer3 : String
    var imageID : String
    var selected : Bool
    
    init(question: String, answer: String, Answer1: String, Answer2: String, Answer3: String, imageId : String){
        self.quest = question
        self.answer = answer
        self.Answer1 = Answer1
        self.Answer2 = Answer2
        self.Answer3 = Answer3
        self.imageID = imageId
        self.selected = false
    }
    
    
    
    
    
    
    
    
}

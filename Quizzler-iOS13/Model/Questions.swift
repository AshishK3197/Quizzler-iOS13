//
//  Questions.swift
//  Quizzler-iOS13
//


import Foundation

struct Question {
    let text : String
    var answer = [String]()
    let cA : String
    
    
    init(q: String , a: [String] , correctAnswer : String) {
        text = q
        answer = a
        cA = correctAnswer
    }
}


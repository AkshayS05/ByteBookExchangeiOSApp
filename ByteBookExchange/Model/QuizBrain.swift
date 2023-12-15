//
//  QuizBrain.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-09.
//

import Foundation

struct QuizBrain {
 
    var score = 0
    let quiz = [
        Question(text: "Hashmaps can be built using", answers: ["Arrays", "Binary Trees", "Graphs", "LinkedList"], rightAnswer: "Arrays"),
        Question(text: "Time Complexity for binary trees are", answers: ["O(1)", "O(n)", "O(n2)", "O(n3)"],rightAnswer: "O(n)"),
        Question(text: "Linked list can be implemented using", answers: ["Stacks", "Queues", "Arrays", "HashMaps"], rightAnswer: "Arrays")
    ]
    var questionNumber = 0
    
    mutating func checkAnswer(_ userAns:String) -> Bool{
   
        if userAns == quiz[questionNumber].rightAnswer
        {
            score += 1
            return true
            
        }   else {
            return false
        }
        
    }
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    func getAnsText(num: Int) -> String {
    
            return quiz[questionNumber].answers[num]
        
    }
    func getProgress() -> Float{
        let progress = Float(questionNumber) / Float(quiz.count)
        return progress

    }
    mutating func nextQuestion() -> Bool{
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
            return false
        } else {
            
           return true
        }
    }
    func getScore() -> Int{
        return score
    }


}

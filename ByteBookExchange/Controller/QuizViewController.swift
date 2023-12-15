//
//  QuizViewController.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-08.
//

import UIKit

class QuizViewController: QuizView, UserLogout {
    
    lazy var logOutLabelTapGesture: UITapGestureRecognizer = {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logOutLabelTapped))
          tapGesture.numberOfTapsRequired = 1
          return tapGesture
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        [option1Button, option2Button, option3Button, option4Button].forEach { button in
            button.addTarget(self, action: #selector(answerButtonClicked), for: .touchUpInside)
        }
        logOutLabel.isUserInteractionEnabled = true
        logOutLabel.addGestureRecognizer(logOutLabelTapGesture)
    }
    @objc private func optionSelected(_ sender: UIButton) {
        // Handling option selection
        print("Selected option: \(sender.title(for: .normal) ?? "")")
    }
    
    @objc func updateUI(){
        //score label
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        // text for questionLabel
        questionLabel.text = quizBrain.getQuestionText()
        option1Button.setTitle(quizBrain.getAnsText(num: 0), for: .normal)
        option2Button.setTitle(quizBrain.getAnsText(num: 1), for: .normal)
        option3Button.setTitle(quizBrain.getAnsText(num: 2), for: .normal)
        option4Button.setTitle(quizBrain.getAnsText(num: 3), for: .normal)
        
        //setting back to previous colors
        [option1Button, option2Button, option3Button, option4Button].forEach { button in
            configureButton(button)
        }
        progressBar.progress = quizBrain.getProgress()
    }
        
    @objc func answerButtonClicked(_ sender: UIButton) {
        let userAns = sender.currentTitle!
        let isAnsCorrect = quizBrain.checkAnswer(userAns)
        if isAnsCorrect{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.nextQuestion() == true {
            titleLabel.text = "Well Done!"
            [option1Button, option2Button, option3Button, option4Button].forEach { button in
                button.isHidden = true
            }
            questionLabel.isHidden = true
            finishedLabel.isHidden = false
            if quizBrain.score == quizBrain.quiz.count {
                titleLabel.text = "Excellent, Your got all right!"
            }else {
                titleLabel.text = "Well Done, you got many right"

            }
            
        }
        // Invalidate the previous timer
        timer?.invalidate()
        
        // Schedule a new timer
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
   
    @objc func logOutLabelTapped() {
           logOut()
       }
}

//
//  QuizView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
//
//  QuizView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
import UIKit

class QuizView: UIViewController {
    var quizBrain = QuizBrain()
    // timer property
    var timer: Timer?
    
    let finishedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Finished"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let logOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log Out"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .red
        return label
    }()
    
    let wellDoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Well Done!"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score: 0"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "bbe_icon")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Arrays' Quiz"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let option1Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let option2Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let option3Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let option4Button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.0
        progressView.progressTintColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        progressView.backgroundColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
        
        return progressView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
        
        setupConstraints()
        view.addSubview(logOutLabel)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            // Constraints for logOutLabel
            logOutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logOutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Constraints for scoreLabel
            scoreLabel.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 20),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(questionLabel)
        view.addSubview(option1Button)
        view.addSubview(option2Button)
        view.addSubview(option3Button)
        view.addSubview(option4Button)
        view.addSubview(progressBar)
        view.addSubview(finishedLabel)
        view.addSubview(wellDoneLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for imageView
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            // Constraints for titleLabel
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Constraints for questionLabel
            questionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Constraints for option1Button
            option1Button.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            option1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            // Constraints for option2Button (top, trailing)
            option2Button.topAnchor.constraint(equalTo: option1Button.topAnchor),
            option2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            // Constraints for option3Button (leading, top)
            option3Button.topAnchor.constraint(equalTo: option1Button.bottomAnchor, constant: 20),
            option3Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            // Constraints for option4Button (top, trailing)
            option4Button.topAnchor.constraint(equalTo: option3Button.topAnchor),
            option4Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            
            // Constraints for horizontal spacing between options on the same row
            option2Button.widthAnchor.constraint(equalTo: option1Button.widthAnchor),
            option4Button.widthAnchor.constraint(equalTo: option3Button.widthAnchor),
            // Constraints for option1Button with increased width
            option1Button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            // Constraints for option2Button with increased width
            option2Button.widthAnchor.constraint(equalTo: option1Button.widthAnchor),
            
            // Constraints for option3Button with increased width
            option3Button.widthAnchor.constraint(equalTo: option1Button.widthAnchor),
            
            // Constraints for option4Button with increased width
            option4Button.widthAnchor.constraint(equalTo: option1Button.widthAnchor),
            
            // Constraints for progressBar
            progressBar.topAnchor.constraint(equalTo: option4Button.bottomAnchor, constant: 30),
            progressBar.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            progressBar.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            
            //constraints for the finishedLabel and wellDoneLabel
            finishedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finishedLabel.topAnchor.constraint(equalTo: wellDoneLabel.bottomAnchor, constant: 10),
            
            // Constraints for wellDoneLabel
            wellDoneLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wellDoneLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
        ])
        
        // Configure option1Button
        configureButton(option1Button)
        
        // Configure option2Button
        configureButton(option2Button)
        
        // Configure option3Button
        configureButton(option3Button)
        
        // Configure option4Button
        configureButton(option4Button)
    }

    // Function to configure the appearance of option buttons
    func configureButton(_ button: UIButton) {
        // Create a custom RGB color
        let customColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
        
        // borders for button
        button.layer.borderWidth = 1.0
        button.layer.borderColor = customColor.cgColor
        
        // Changing background color
        button.backgroundColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
    }
}

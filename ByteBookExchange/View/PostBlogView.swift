//
//  PostBlogView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//

import UIKit
class PostBlogView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     let usernameIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        let maxWidthConstraint = imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 40)
        maxWidthConstraint.priority = .defaultLow
        maxWidthConstraint.isActive = true
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return imageView
    }()
    
     let logOutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Log Out"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .blue
        return label
    }()
    
     let titleTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        return textField
    }()

    
     let categoryPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
     let blogEntryTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
     let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        button.layer.cornerRadius = 8

        return button
    }()
    
     let categories = ["Problem Solving", "FrontEnd Development", "BackEnd Development"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        // Set the delegate and dataSource for the categoryPicker
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
       
    }
    
    private func setupViews() {
        view.addSubview(usernameIcon)
        view.addSubview(logOutLabel)
        view.addSubview(categoryPicker)
        view.addSubview(titleTextField)
        view.addSubview(blogEntryTextView)
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func submitButtonTapped(_ sender: UIButton) {
          // This method is overridden by the subclass
          fatalError("submitButtonTapped(_:) must be overridden by subclass")
      }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            usernameIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            usernameIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            usernameIcon.widthAnchor.constraint(lessThanOrEqualToConstant: 40),
            usernameIcon.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            logOutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logOutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            categoryPicker.topAnchor.constraint(equalTo: usernameIcon.bottomAnchor, constant: 20),
            categoryPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: categoryPicker.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            blogEntryTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            blogEntryTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            blogEntryTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            blogEntryTextView.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    
    // UIPickerViewDataSource and UIPickerViewDelegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
}

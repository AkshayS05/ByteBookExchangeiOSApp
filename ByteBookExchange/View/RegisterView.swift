//
//  RegisterView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
import UIKit
class RegisterView: UIViewController{
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "bbe_icon")
        return imageView
    }()
    
     let brandTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Register"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        return label
    }()
    
    
     let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        return textField
    }()
    
     let emailErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
     let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
     let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
     let passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
     let commonErrorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.isHidden = true
        return label
    }()
    
     lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, brandTitle, emailTextField, emailErrorLabel, usernameTextField, passwordTextField, passwordErrorLabel, submitButton, commonErrorLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
     var traitObserver: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupViews()
        setupConstraints()
        
        // Adjusting layout for the initial trait collection
        adjustLayoutForTraitCollection(traitCollection)
        
        // Registering for trait changes
        traitObserver = view.observe(\.traitCollection) { [weak self] (_, _) in
            self?.adjustLayoutForTraitCollection(self?.view.traitCollection ?? UITraitCollection())
        }
     
    }
    
     func setupViews() {
        view.addSubview(stackView)
    }
    
     func setupConstraints() {
        // Constraints for stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        // Constraint for imageView height
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
    
     func adjustLayoutForTraitCollection(_ traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            // Portrait mode with spacing
            stackView.spacing = 20
        } else {
            // Landscape or other size classes without spacing
            stackView.spacing = 0
        }
    }
}

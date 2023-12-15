//
//  WelcomeScreenView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//

import UIKit
class WelcomeScreenView: UIViewController{
    
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
        label.text = "Byte Book Exchange"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        return label
    }()
    
     let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
     let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
     lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, brandTitle, registerButton, loginButton])
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
        
        //animation for title
        brandTitle.text = ""
        let title = "Byte Book Exchange"
        var characterIndex = 0.0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * characterIndex, repeats: false) { timer in
                self.brandTitle.text?.append(letter)
            }
            characterIndex += 1
        }
        
        // Adjusting layout for the initial trait collection
        adjustLayoutForTraitCollection(traitCollection)
        
        // Registerng for trait changes
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
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Center vertically
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        // Constraint for imageView height
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
     func adjustLayoutForTraitCollection(_ traitCollection: UITraitCollection) {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            // Portrait mode with spacing
            stackView.spacing = 35
        } else {
            // Landscape without spacing
            stackView.spacing = 0
        }
    }
    
}

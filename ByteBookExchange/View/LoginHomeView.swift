//
//  LoginHomeView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
import UIKit
class LoginHomeView: UIViewController {

     let usernameIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
         imageView.tintColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        // Adjusting content compression resistance and hugging priorities
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        return imageView
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

     let viewBlogsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("View Blogs", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()

     let takeQuizButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Take Quiz", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()

     lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [viewBlogsButton, takeQuizButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        return stackView
    }()

     lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameIcon, imageView, brandTitle, buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        return stackView
    }()


     lazy var portraitLayoutGuide: UILayoutGuide = {
        let layoutGuide = UILayoutGuide()
        self.view.addLayoutGuide(layoutGuide)
        return layoutGuide
    }()


    // Inside the setupViews method
    func setupViews() {
        view.addSubview(mainStackView)
        view.addSubview(logOutLabel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationItem.hidesBackButton = true
        setupViews()
        setupConstraints()
        observeTraitChanges()

    }

     func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for mainStackView
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
         NSLayoutConstraint.activate([
             // Constraints for logOutLabel
             logOutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             logOutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
         ])

        NSLayoutConstraint.activate([
            // Constraints for usernameIcon
            usernameIcon.widthAnchor.constraint(equalToConstant: 40),
            usernameIcon.heightAnchor.constraint(equalToConstant: 40),
        ])

        NSLayoutConstraint.activate([
            // Constraints for imageView
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
        ])

        NSLayoutConstraint.activate([
            // Constraints for buttonStackView
            buttonStackView.topAnchor.constraint(equalTo: brandTitle.bottomAnchor, constant: 5), // Adjust the top constraint
            buttonStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
        ])

        // Constraints for portraitLayoutGuide
        NSLayoutConstraint.activate([
            portraitLayoutGuide.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            portraitLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            portraitLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            portraitLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])

        // Initial layout guide constraints
        updateLayoutGuideConstraints()
    }

     func observeTraitChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateLayoutGuideConstraints), name: UIScreen.modeDidChangeNotification, object: nil)
    }

    @objc  func updateLayoutGuideConstraints() {
        // Adjusting the spacing between title and buttons only in portrait mode
        portraitLayoutGuide.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width < UIScreen.main.bounds.height ? 20 : 0).isActive = true
    }
    
}

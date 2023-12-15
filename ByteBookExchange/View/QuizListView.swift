//
//  QuizListView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//

import UIKit
class QuizListView: UIViewController {
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

       //content compression resistance priority
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

    let titleLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "Welcome to"
       label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
       return label
   }()

    let appNameLabel: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "Byte Book Exchange"
       label.textAlignment = .center
       label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
       label.textColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)
       return label
   }()

    let tableView: UITableView = {
       let tableView = UITableView()
       tableView.translatesAutoresizingMaskIntoConstraints = false
       return tableView
   }()

    let portraitLayoutGuide = UILayoutGuide()

   // Data for the table view
    let tableViewData = ["Arrays Quiz", "Stacks Data Structures Quiz", "Queue Data Structure Quiz"]

   override func viewDidLoad() {
       super.viewDidLoad()

       view.backgroundColor = UIColor.white
       title = "BYTE BOOK EXCHANGE"
       setupViews()
       setupConstraints()

       // Registering for trait changes
       registerForTraitChanges([UITraitUserInterfaceStyle.self]) { [weak self] (viewController: UIViewController, previousTraitCollection: UITraitCollection) in
           self?.updateLayoutGuideConstraints()
       }
   }

    func setupViews() {
       view.addSubview(usernameIcon)
       view.addSubview(logOutLabel)
       view.addSubview(titleLabel)
       view.addSubview(appNameLabel)
       view.addSubview(tableView)
       view.addLayoutGuide(portraitLayoutGuide)

       // Setting the table view delegate and data source
       tableView.delegate = self
       tableView.dataSource = self
       // Registering a cell for the table view
       tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
   }

    func setupConstraints() {
       NSLayoutConstraint.activate([
           // Constraints for usernameIcon
           usernameIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
           usernameIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
           usernameIcon.widthAnchor.constraint(lessThanOrEqualToConstant: 40),
           usernameIcon.heightAnchor.constraint(equalToConstant: 40),
       ])

       NSLayoutConstraint.activate([
           // Constraints for logOutLabel
           logOutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
           logOutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
       ])

       NSLayoutConstraint.activate([
           // Constraints for titleLabel
           titleLabel.topAnchor.constraint(equalTo: usernameIcon.bottomAnchor, constant: 20),
           titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
       ])

       NSLayoutConstraint.activate([
           // Constraints for appNameLabel
           appNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
           appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
       ])

       NSLayoutConstraint.activate([
           // Constraints for tableView
           tableView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 20),
           tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           tableView.bottomAnchor.constraint(equalTo: portraitLayoutGuide.topAnchor, constant: -20),
       ])

       // Constraints for portraitLayoutGuide
       NSLayoutConstraint.activate([
           portraitLayoutGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           portraitLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
           portraitLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
       ])

       // Initial layout guide constraints
       updateLayoutGuideConstraints()
   }

    func updateLayoutGuideConstraints() {
       // Adjust the spacing between title and buttons only in portrait mode
       portraitLayoutGuide.heightAnchor.constraint(equalToConstant: view.traitCollection.verticalSizeClass == .compact ? 20 : 0).isActive = true
   }
   }

   extension QuizListView: UITableViewDataSource {
       func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
           return tableViewData.count
       }
       
       
       func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           cell.textLabel?.text = tableViewData[indexPath.row]
           cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
           cell.backgroundColor = UIColor(red: 0.6157, green: 0.2980, blue: 0.1059, alpha: 1.0)
           cell.textLabel?.textColor = UIColor.white
           cell.layer.borderWidth = 1.0
           // Optionally, set a selected background color
           let selectedBackgroundView = UIView()
           selectedBackgroundView.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
           return cell
       }
       
   }
   extension QuizListView: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 60
   }

   }

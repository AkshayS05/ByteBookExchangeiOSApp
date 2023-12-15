//
//  GenericBlogView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//

//
//  GenericBlogView.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
import UIKit

class GenericBlogView: UIViewController {
    let usernameIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "person.circle")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.tintColor = UIColor(red: 0.8235, green: 0.5137, blue: 0.2471, alpha: 1.0)

        // Setting maximum width constraint
        let maxWidthConstraint = imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 40)
        maxWidthConstraint.priority = .defaultLow
        maxWidthConstraint.isActive = true

        // Content compression resistance priority
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // Dummy data for the table view
    var tableViewData = ["JavaScript is easy", "Swift Fundamentals", "Building UI with SwiftUI", "Web Development Basics"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "BYTE BOOK EXCHANGE"
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        view.addSubview(usernameIcon)
        view.addSubview(logOutLabel)
        view.addSubview(titleLabel)
        view.addSubview(tableView)

        // Set the title
        titleLabel.text = self.title ?? "Blogs"

        // Set the table view delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        // Registering a cell for the table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        // Add tap gesture recognizer to titleLabel
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(titleLabelTapped))
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(tapGesture)
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
            // Constraints for tableView
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    // Handle tap on titleLabel
    @objc func titleLabelTapped() {
        guard let selectedTitle = titleLabel.text else {
            print("Selected title is nil")
            return
        }
        navigateToDetailPostController(with: selectedTitle)
    }

    // Function to navigate to GenericDetailPostController
    func navigateToDetailPostController(with titleLabel: String) {
        let genericDetailBlogVC = GenericDetailPostController()
        genericDetailBlogVC.titleText = titleLabel
        genericDetailBlogVC.screenTitle = title
        navigationController?.pushViewController(genericDetailBlogVC, animated: true)
    }
}

extension GenericBlogView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tableViewData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return cell
    }
}

//UITableViewDelegate

extension GenericBlogView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    // Handle selection if needed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTitle = tableViewData[indexPath.row]
        navigateToDetailPostController(with: selectedTitle)
    }
}

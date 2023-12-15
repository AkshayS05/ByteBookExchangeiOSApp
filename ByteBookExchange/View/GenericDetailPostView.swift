//
//  GenericDetailPost.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//
import UIKit
class GenericDetailPostView : UIViewController{
    var titleText: String?
    var bodyText: String?
    var screenTitle: String?
    
    let scrollView: UIScrollView = {
          let scrollView = UIScrollView()
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          return scrollView
      }()

      let contentView: UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    
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
        label.textColor = .blue
        return label
    }()
    
     let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
     let postTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
     let bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0 
        return label
    }()
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.white
            setupViews()
            setupConstraints()
            title = "BYTE BOOK EXCHANGE"
            postTitleLabel.text = titleText
        }

    
    func setupViews() {
           view.addSubview(scrollView)
           scrollView.addSubview(contentView)
           contentView.addSubview(usernameIcon)
           contentView.addSubview(logOutLabel)
           contentView.addSubview(titleLabel)
           contentView.addSubview(postTitleLabel)
           contentView.addSubview(bodyLabel)
        
        bodyLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]

       }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
               // Constraints for scrollView
               scrollView.topAnchor.constraint(equalTo: view.topAnchor),
               scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           ])

           NSLayoutConstraint.activate([
               // Constraints for contentView
               contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
               contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
               contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
               contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
               contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
               contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),

           ])
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
               // Constraints for postTitleLabel
               postTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
               postTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               postTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
           ])
           
           NSLayoutConstraint.activate([
               // Constraints for bodyLabel
               bodyLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: 20),
               bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
           ])
       }
   }

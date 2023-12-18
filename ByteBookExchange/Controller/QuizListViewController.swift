//
//  QuizListViewController.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-13.
//


import UIKit
class QuizListViewController: QuizListView, UserLogout {
    
    lazy var logOutLabelTapGesture: UITapGestureRecognizer = {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logOutLabelTapped))
          tapGesture.numberOfTapsRequired = 1
          return tapGesture
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logOutLabel.isUserInteractionEnabled = true
        logOutLabel.addGestureRecognizer(logOutLabelTapGesture)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = tableViewData[indexPath.row]

            // navigation based on the selected item
            switch selectedItem {
            case "Arrays Quiz":
                navigateToQuizScreen(title: "")
            case "Stacks Data Structures Quiz":
                navigateToQuizScreen(title: "")
            case "Queue Data Structures Quiz":
                navigateToQuizScreen(title: "")
            default:
                break
            }
        }

        private func navigateToQuizScreen(title: String) {
            let genericQuizVC = QuizViewController()
            genericQuizVC.title = title
            navigationController?.pushViewController(genericQuizVC, animated: true)
        }
    @objc func logOutLabelTapped() {
           logOut()
       }
}

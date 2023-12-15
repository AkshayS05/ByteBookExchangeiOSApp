import UIKit
import FirebaseAuth

class LoginHomeViewController: LoginHomeView, UserLogout {

    lazy var logOutLabelTapGesture: UITapGestureRecognizer = {
          let tapGesture = UITapGestureRecognizer(target: self, action: #selector(logOutLabelTapped))
          tapGesture.numberOfTapsRequired = 1
          return tapGesture
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewBlogsButton.addTarget(self, action: #selector(blogsButtonClicked), for: .touchUpInside)
        takeQuizButton.addTarget(self, action: #selector(quizButtonClicked), for: .touchUpInside)
      
        logOutLabel.isUserInteractionEnabled = true
        logOutLabel.addGestureRecognizer(logOutLabelTapGesture)
    }


    //Methods
    @objc private func blogsButtonClicked() {
      
        let blogViewController = BlogViewController()
        self.navigationController?.pushViewController(blogViewController, animated: true)
    }   
    
    @objc private func quizButtonClicked() {
       
        let quizViewController = QuizListViewController()
        self.navigationController?.pushViewController(quizViewController, animated: true)
    }
    
    @objc func logOutLabelTapped() {
           logOut()
       }
}

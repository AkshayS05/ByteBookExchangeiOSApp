import UIKit
import FirebaseAuth

class LoginViewController: LoginView {

   override func viewDidLoad() {
        super.viewDidLoad()

        submitButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    @objc private func loginButtonClicked() {
        // Reseting error labels
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        commonErrorLabel.isHidden = true

        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error as NSError? {
                    switch error.code {
                    case AuthErrorCode.invalidEmail.rawValue:
                        self?.emailErrorLabel.text = "Invalid email"
                        self?.emailErrorLabel.isHidden = false
                    case AuthErrorCode.wrongPassword.rawValue:
                        self?.passwordErrorLabel.text = "Wrong password"
                        self?.passwordErrorLabel.isHidden = false
                    case AuthErrorCode.userNotFound.rawValue:
                        self?.commonErrorLabel.text = "User not found. Please register."
                        self?.commonErrorLabel.isHidden = false
                    default:
                        self?.commonErrorLabel.text = "Login failed. Please try again."
                        self?.commonErrorLabel.isHidden = false
                    }
                    print("Error: \(error.localizedDescription)")
                } else if email == "Akshaysharma@gmail.com" && password == "123456" {
                    let adminViewController = PostBlogViewController()

                    self?.navigationController?.pushViewController(adminViewController, animated: true)
                }
                
                else {
                    let loginViewController = LoginHomeViewController()
                    self?.navigationController?.pushViewController(loginViewController, animated: true)
                }
            }
        }
    }

}

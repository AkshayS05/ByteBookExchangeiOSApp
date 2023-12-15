//
//  RegisterController.swift
//  ByteBookExchange
//
//  Created by Akshay Sharma on 2023-12-05.
//

import UIKit
import FirebaseAuth

class RegisterViewController: RegisterView {

  override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }

    @objc private func registerButtonClicked() {
        // Reset error labels
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        commonErrorLabel.isHidden = true

        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error as NSError? {
                    switch error.code {
                    case AuthErrorCode.invalidEmail.rawValue:
                        self?.emailErrorLabel.text = "Invalid email"
                        self?.emailErrorLabel.isHidden = false
                    case AuthErrorCode.weakPassword.rawValue:
                        self?.passwordErrorLabel.text = "Weak password. Please use a stronger password."
                        self?.passwordErrorLabel.isHidden = false
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        self?.commonErrorLabel.text = "Email already in use. Please choose a different email."
                        self?.commonErrorLabel.isHidden = false
                    default:
                        self?.commonErrorLabel.text = "Registration failed. Please try again."
                        self?.commonErrorLabel.isHidden = false
                    }
                    print("Error: \(error.localizedDescription)")
                } else {
                    let registerViewController = LoginHomeViewController()
                    self?.navigationController?.pushViewController(registerViewController, animated: true)
                }
            }
        }
    }

}

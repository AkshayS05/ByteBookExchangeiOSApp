import Foundation
class ResponsiveViewController: WelcomeScreenView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adding target for registerButton click
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }

    @objc private func registerButtonClicked() {
    
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    @objc private func loginButtonClicked() {

        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}

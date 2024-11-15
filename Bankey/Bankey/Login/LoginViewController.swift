//
//  ViewController.swift
//  Bankey
//
//  Created by Mithun M R on 14/11/24.
//

import UIKit

class LoginViewController: UIViewController {
    let loginView  =  LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let loginTitleLabel = UILabel()
    var userName: String? {
        loginView.userTextField.text
    }

    var password:String? {
        loginView.passwordTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        loginTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTitleLabel.text = "login"
        loginTitleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        loginTitleLabel.textAlignment = .left

        loginView.translatesAutoresizingMaskIntoConstraints = false

        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)

        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 1
        errorMessageLabel.isHidden =  true

    }
    
    private func layout() {
        view.addSubview(loginTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)

        // Login title constraints
        NSLayoutConstraint.activate([
            loginTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            loginTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: loginTitleLabel.bottomAnchor, multiplier: 1)
        ])

        // Login view contraints
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])

        // Sign-in button contraints
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])

        // Error message label constraints
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}


extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        login()
    }

    private func login() {
        guard let username = userName, let password = password else {
            return
        }

        if username.isEmpty && password.isEmpty {
            configErrorMessage(with: "Credentials can't be empty")
            return
        }

        if username == "mrm" && password == "123" {
            errorMessageLabel.isHidden =  false
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configErrorMessage(with: "invalid credentials")
        }
    }

    private func configErrorMessage(with message: String) {
        errorMessageLabel.isHidden =  false
        errorMessageLabel.text = message
    }
}

//
//  LoginView.swift
//  Bankey
//
//  Created by Mithun M R on 14/11/24.
//

import UIKit

class LoginView: UIView {
    let stackView = UIStackView()
    let userTextField = UITextField()
    let passwordTextField = UITextField()
    let divider = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(Coder: ) has not been implemted")
    }
}


extension LoginView {
    func style() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 8
        self.clipsToBounds

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8

        userTextField.translatesAutoresizingMaskIntoConstraints  = false
        userTextField.placeholder = "Username"
        userTextField.autocapitalizationType = .none
        userTextField.delegate = self

        passwordTextField.translatesAutoresizingMaskIntoConstraints  = false
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.delegate = self

        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .lightGray


    }

    func layout() {
        stackView.addArrangedSubview(userTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTextField)

        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: userTextField.trailingAnchor, multiplier: 1),
            self.bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       true
    }
}

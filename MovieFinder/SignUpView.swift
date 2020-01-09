//
//  SignUpView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    let usernameTextField = AuthenticationTextField()
    let emailTextField = AuthenticationTextField()
    let passwordTextField = AuthenticationTextField()
    let signUpButton = AuthenticationButton()
    
    let signUpHeader: UILabel = {
        let header = UILabel()
        header.text = "Sign Up"
        header.textColor = UIColor.titleTextColor
        header.font = UIFont.titleFont
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var loginButton: UIButton = {
        let stringAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16),
        .foregroundColor: UIColor.white,
        .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSMutableAttributedString(string: "Already have an account? Login", attributes: stringAttributes)
        
        let button = UIButton()
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = UIColor.backgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
                
        button.addTarget(self, action: #selector(SignUpController.loginButtonPressed) , for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor

        placeSignUpHeader()
        placeUsernameTextField()
        placeEmailTextField()
        placePasswordTextField()
        placeSignUpButton()
        placeLoginButton()
        
    }
    
    func placeSignUpHeader() {
        addSubview(signUpHeader)
        
        signUpHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        
        signUpHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func placeUsernameTextField() {
        addSubview(usernameTextField)
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string: " Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        usernameTextField.topAnchor.constraint(equalTo: signUpHeader.bottomAnchor, constant: 150).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
    }
    
    func placeEmailTextField() {
        addSubview(emailTextField)
        emailTextField.attributedPlaceholder = NSAttributedString(string: " Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor).isActive = true
    }
    
    func placePasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor).isActive = true
    }
    

    
    func placeSignUpButton() {
        addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true


    }
    
    func placeLoginButton() {
        addSubview(loginButton)
        
        loginButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 15).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

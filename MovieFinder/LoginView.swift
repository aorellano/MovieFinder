//
//  LoginView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/7/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class LoginView: UIView {
    let emailTextField = AuthenticationTextField()
    let passwordTextField = AuthenticationTextField()
    let loginButton = AuthenticationButton()
    
    var loginHeader: UILabel = {
        let header = UILabel()
        header.text = "Login"
        header.textColor = UIColor.titleTextColor
        header.font = UIFont.titleFont
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()
    
    var signUpButton: UIButton = {
        let stringAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.systemFont(ofSize: 16),
        .foregroundColor: UIColor.white,
        .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedString = NSMutableAttributedString(string: "Sign up", attributes: stringAttributes)
        
        let button = UIButton()
        button.setAttributedTitle(attributedString, for: .normal)
        button.backgroundColor = UIColor.backgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
                
        button.addTarget(self, action: #selector(LoginController.signUpButtonPressed) , for: .touchUpInside)
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        
        setupLoginHeader()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupSignUpButton()
    }
    
    func setupLoginHeader() {
        addSubview(loginHeader)
        
        loginHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35).isActive = true
        loginHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.attributedPlaceholder = NSAttributedString(string: " Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        emailTextField.topAnchor.constraint(equalTo: loginHeader.bottomAnchor, constant: 150).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
    }
    
    func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryTextColor])
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor).isActive = true
        
    }
    
    func setupLoginButton() {
        addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor).isActive = true
    }
    
    func setupSignUpButton() {
        addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
    }
    

    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

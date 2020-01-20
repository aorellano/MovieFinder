//
//  LoginView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/7/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class LoginView: UIView {
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = UIColor.titleTextColor
        label.font = UIFont.titleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Login", "Sign Up"])
        segmentedControl.backgroundColor = UIColor.accentColor
//        segmentedControl.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let inputsContainerView = LoginInputsContainerView()
    
    lazy var loginRegisterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.tintColor
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
            
    //        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        
        setupHeaderLabel()
        setupInputsContainerView()
        setupLoginSegmentedControl()
        setupLoginRegisterButton()
    }
    
    func setupHeaderLabel() {
        addSubview(headerLabel)
           
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
        headerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
       }
    
    func setupInputsContainerView() {
        addSubview(inputsContainerView)
        inputsContainerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        inputsContainerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, constant: -24).isActive = true
        
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 180)
               
        inputsContainerViewHeightAnchor?.isActive = true
    }
    
    func setupLoginSegmentedControl() {
        addSubview(loginRegisterSegmentedControl)
           
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: inputsContainerView.topAnchor, constant: -20).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
       }
    
    func setupLoginRegisterButton() {
        addSubview(loginRegisterButton)
        loginRegisterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 20).isActive = true
        loginRegisterButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

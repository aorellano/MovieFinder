//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    let signUpView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func signUpButtonPressed() {
        print("Hello there")
    }
    
    @objc func loginButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

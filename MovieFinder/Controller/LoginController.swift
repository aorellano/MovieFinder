//
//  ViewController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/7/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func signUpButtonPressed() {
        print("Sign up button was pressed")
    }
}


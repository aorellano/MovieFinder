//
//  ViewController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/7/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    let loginView = LoginView()
    

//    func handleLogin() {
//        print("Hello")
//        guard let email = emailTextField.text, let password = passwordTextField.text else {
//            print("Form is not valid")
//            return
//        }
//            
//        Auth.auth().signIn(withEmail: email, password: password, completion: { (currentUser, error) in
//                    
//            if error != nil {
//                print(error)
//            }
//            let homeVC = HomeController()
//            self.navigationController?.pushViewController(homeVC, animated: true)
//        })
//        
//    }
//    
//    @objc func handleRegister() {
//        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
//            print("Form is not valid")
//            return
//        }
//        
//        Auth.auth().createUser(withEmail: email, password: password, completion: { (currentUser, error) in
//            
//            if error != nil {
//                print(error as Any)
//                return
//            }
//            
//            guard let uid = currentUser?.user.uid else {
//                return
//            }
//            
//            let ref = Database.database().reference(fromURL: "https://moviefinder-edef6.firebaseio.com/")
//            let usersReference = ref.child("users").child(uid)
//            let values = ["name": name, "email": email]
//            usersReference.updateChildValues(values, withCompletionBlock: { (error, ref) in
//                if error != nil {
//                    print(error as Any)
//                    return
//                }
//                
//                let homeVC = HomeController()
//                self.navigationController?.pushViewController(homeVC, animated: true)
//                
//            })
//        })
//        print(123123)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.backgroundColor
//        setupInputsContainerView()
//        setupLoginRegisterButton()
//
//    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        view = loginView
    }
    
    @objc func signUpButtonPressed() {
        print("Sign up button was pressed")
        
        let homeVC = HomeController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
}


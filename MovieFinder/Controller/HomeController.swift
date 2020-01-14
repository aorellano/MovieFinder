//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    let signUpView = SignUpView()
    
    let accountNameView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
        
        setupAccountNameView()
        checkIfUserIsLoggedIn()
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    guard let name = (dictionary["name"] as? String)?.components(separatedBy: [" "]) else {
                        return
                    }

                    let nameInitials = String(name.compactMap({$0.first}))
                    
                    print(nameInitials)
                    self.accountNameLabel.text = nameInitials
                }
                
            }, withCancel: nil)
            
        }
    }
    
    func setupAccountNameView() {
        view.addSubview(accountNameView)
        accountNameView.addSubview(accountNameLabel)
        
        
        accountNameView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        accountNameView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        accountNameView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        accountNameView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        accountNameLabel.centerXAnchor.constraint(equalTo: accountNameView.centerXAnchor).isActive = true
        accountNameLabel.centerYAnchor.constraint(equalTo: accountNameView.centerYAnchor).isActive = true
        
    }
    
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
    }
    
}


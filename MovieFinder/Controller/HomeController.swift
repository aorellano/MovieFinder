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
    
    let movieCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    
    let accountNameButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(accountNameButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.backgroundColor
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        
       
        checkIfUserIsLoggedIn()
        
        setupAccountNameButton()
        setupCollectionView()
        
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
    
    func setupAccountNameButton() {
        view.addSubview(accountNameButton)
        accountNameButton.addSubview(accountNameLabel)
        
        
        accountNameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        accountNameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        accountNameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        accountNameButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        accountNameLabel.centerXAnchor.constraint(equalTo: accountNameButton.centerXAnchor).isActive = true
        accountNameLabel.centerYAnchor.constraint(equalTo: accountNameButton.centerYAnchor).isActive = true
        
    }
    
    func setupCollectionView() {
        view.addSubview(movieCollectionView)
        
        movieCollectionView.topAnchor.constraint(equalTo: accountNameButton.bottomAnchor, constant: 40).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func accountNameButtonPressed() {
        let settingsVC = SettingsController()
        
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        navigationController?.pushViewController(loginController, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: movieCollectionView.bounds.width/2.3, height: movieCollectionView.bounds.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.tintColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    
}


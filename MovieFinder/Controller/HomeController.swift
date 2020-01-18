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
    var stringAttributes: [NSAttributedString.Key: Any]!
    
    let movieCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    let searchField: UITextField = {
        let search = UITextField()
        search.borderStyle = .roundedRect
        search.placeholder = "Search"
        search.backgroundColor = UIColor.accentColor
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    let movieLocationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let movieLocationSymbol: UIImageView = {
        let image = UIImage(named: "LocationSymbol")
        let symbol = UIImageView(image: image)
        symbol.translatesAutoresizingMaskIntoConstraints = false
        return symbol
    }()
    
    let movieLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Location"
        label.font = UIFont.locationTextFont
        label.textColor = UIColor.secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieShowingsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let movieSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Now Showing", "Upcoming"])
        control.tintColor = .clear
        control.selectedSegmentIndex == 0
        control.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    let nowPlayingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Now Playing", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let upcomingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Upcoming", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        setupSearchField()
        setupMovieLocationView()
        setupMovieShowingsView()
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
        
        
        accountNameButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        accountNameButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        accountNameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        accountNameButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        accountNameLabel.centerXAnchor.constraint(equalTo: accountNameButton.centerXAnchor).isActive = true
        accountNameLabel.centerYAnchor.constraint(equalTo: accountNameButton.centerYAnchor).isActive = true
        
    }
    
    func setupSearchField() {
        view.addSubview(searchField)
        
        searchField.topAnchor.constraint(equalTo: accountNameButton.bottomAnchor, constant: 10).isActive = true
        searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupMovieLocationView() {
        view.addSubview(movieLocationView)
        movieLocationView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        movieLocationView.leadingAnchor.constraint(equalTo: searchField.leadingAnchor, constant: 5).isActive = true
        movieLocationView.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: -5).isActive = true
        movieLocationView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 10).isActive = true
        
        movieLocationView.addSubview(movieLocationSymbol)
        movieLocationSymbol.centerYAnchor.constraint(equalTo: movieLocationView.centerYAnchor).isActive = true
        movieLocationSymbol.leadingAnchor.constraint(equalTo: movieLocationView.leadingAnchor, constant: 2).isActive = true
        movieLocationSymbol.heightAnchor.constraint(equalToConstant: 25).isActive = true
        movieLocationSymbol.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        movieLocationView.addSubview(movieLocationLabel)
        movieLocationLabel.centerYAnchor.constraint(equalTo: movieLocationView.centerYAnchor).isActive = true
        movieLocationLabel.leadingAnchor.constraint(equalTo: movieLocationSymbol.trailingAnchor, constant: 10).isActive = true
    }
    
    func setupMovieShowingsView() {
        view.addSubview(movieSegmentedControl)
        
        movieSegmentedControl.removeBorders()
        
        stringAttributes = [
                                  .font: UIFont.boldSystemFont(ofSize: 17),
                                  .foregroundColor: UIColor.white
                              ]
        movieSegmentedControl.setTitleTextAttributes(stringAttributes, for: .normal)
        
        movieSegmentedControl.topAnchor.constraint(equalTo: movieLocationView.bottomAnchor, constant: 8).isActive = true
        movieSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        movieSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieSegmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupCollectionView() {
        view.addSubview(movieCollectionView)
        
        movieCollectionView.topAnchor.constraint(equalTo: movieSegmentedControl.bottomAnchor, constant: 10).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func handleSegmentedControl() {
        stringAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 25),
            .foregroundColor: UIColor.highlightColor
        ]
        
        movieSegmentedControl.setTitleTextAttributes(stringAttributes, for: .selected)
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

extension UISegmentedControl {
    func removeBorders(andBackground:Bool=false) {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: tintColor!), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        _ = self.subviews.compactMap {
            if ($0.frame.width>0) {
                $0.layer.cornerRadius = 8
                $0.layer.borderColor = UIColor.clear.cgColor
                $0.clipsToBounds = true
                $0.layer.borderWidth = andBackground ? 1.0 : 0.0
                $0.layer.borderColor = andBackground ? tintColor?.cgColor : UIColor.clear.cgColor
                andBackground ? $0.layer.backgroundColor = UIColor.clear.cgColor : nil
            }
        }
    }

    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}


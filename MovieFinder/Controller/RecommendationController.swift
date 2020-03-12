//
//  SearchController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/16/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class RecommendationController: UIViewController, CLLocationManagerDelegate {
    let recommendationView = RecommendationView()
    
    let locationManager = CLLocationManager()
    
    private let cellId = "cellId"

    let movieCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)

        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self

        checkIfUserIsLoggedIn()
        setupCollectionView()
        setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
     
    fileprivate func fetchGenericData<T: Decodable>(urlString:String, completion: @escaping (T) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            }catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
        }.resume()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        }
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
                    self.recommendationView.accountNameLabel.text = nameInitials
                }
            }, withCancel: nil)
        }
    }

    func setupCollectionView() {
        view.addSubview(movieCollectionView)

        movieCollectionView.topAnchor.constraint(equalTo: recommendationView.searchFieldView.bottomAnchor, constant: 20).isActive = true
        movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
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

    override func loadView() {
        view = recommendationView
    }
}

extension RecommendationController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (movieCollectionView.bounds.width/2.3), height: 250)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.backgroundColor = UIColor.tintColor
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> CGSize   {
        let width = collectionView.frame.width / 2 - 10
        return CGSize(width: width, height: width * 1.4 + 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}

struct NowPlaying: Decodable {
    let id:Int
    let name:String
}


struct HomeFeed: Decodable {
    let genres: [NowPlaying]
}


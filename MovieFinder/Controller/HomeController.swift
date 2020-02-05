//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

class HomeController: UIViewController, CLLocationManagerDelegate {
    let homeView = HomeView()
    
    let locationManager = CLLocationManager()

    let movieCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = UIColor.backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self

        checkIfUserIsLoggedIn()
        setupCollectionView()
        setupLocationManager()

        
        fetchGenericData(urlString:  "https://api.themoviedb.org/3/movie/now_playing?api_key=25d3b3b13927672472060f6f5971a50f&language=en-US&page=1") { (homeFeed: HomeFeed) in
            homeFeed.results.forEach({print($0.title)})
        }
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
                    self.homeView.accountNameLabel.text = nameInitials
                }
            }, withCancel: nil)
        }
    }

    func setupCollectionView() {
        view.addSubview(movieCollectionView)

        movieCollectionView.topAnchor.constraint(equalTo: homeView.movieSegmentedControl.bottomAnchor, constant: 20).isActive = true
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

    override func loadView() {
        view = homeView
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

struct NowPlaying: Decodable {
    let title:String
    let original_language: String
}


struct HomeFeed: Decodable {
    let results: [NowPlaying]
}

struct Movie: Decodable {
    let title: String
    let original_language: String
}

struct Genre: Decodable {
    let id: Int
    let name: String
}



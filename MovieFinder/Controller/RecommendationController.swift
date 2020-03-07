//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

//List all

final class RecommendationController: UIViewController {
    //When a genre is chosen the tableview should be reloaded with a new
    //set of genres
    let recommendationView = RecommendationView()
    let manager = APIManager()
    
    var genres = [Genre]() {
        didSet {
            recommendationView.genreTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fetchData()
    }
    
    func fetchData() {
        manager.fetchFeed(.genre) {(list: GenreList?, error: Error?) in
            if let error = error {
                print(error)
                return
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        var reducedList = [Genre]()
                        reducedList = Array(list.genres)
                        self.genres = reducedList
                    }
                }
            }
        }
    }
    
    private func setupTableView() {
        recommendationView.genreTableView.dataSource = self
        recommendationView.genreTableView.delegate = self
    }
    

    override func loadView() {
        view = recommendationView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
}

extension RecommendationController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RecommendationCell
        cell.label.text = genres[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //fetch other genres
        print("hi")
        manager.fetchKeywords(.keyword, with: "mystery") { (list: KeywordList?, error: Error?) in
            
            if let error = error {
                print(error)
                return
            } else {
                 DispatchQueue.main.async {
                    if let list = list {
                        var reducedList = [Genre]()
                        reducedList = Array(list.results)
                        self.genres = reducedList
                        
                    }
                }
            }
           
        }
//        manager.fetchFeed(.keyword) { (list: GenreList?, error: Error?) in
//            if let error = error {
//                print(error)
//                return
//            } else {
//                if let list = list {
//                    var reducedList = [Genre]()
//                    reducedList = Array(list.results)
//                    self.genres = reducedList
//                }
//            }
//
//        }
    }
}




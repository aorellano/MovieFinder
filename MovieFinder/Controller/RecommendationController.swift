//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

final class RecommendationController: UIViewController {
    let recommendationView = RecommendationView()
    let manager = APIManager()
    
    var gens = [Genre]() {
        didSet {
            recommendationView.genreTableView.reloadData()
            print(gens)
        }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        
        manager.fetchFeed(.genre) {(list: GenreList?, error: Error?) in
            if let error = error {
                print(error)
                return
            } else {
                DispatchQueue.main.async {
                    if let list = list {
                        var reducedList = [Genre]()
                        reducedList = Array(list.genres)
                        self.gens = reducedList
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
        return gens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RecommendationCell
//        print(genres[indexPath.row].name)
       // cell.label.text = RecommendationFeedResult.shared![indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}




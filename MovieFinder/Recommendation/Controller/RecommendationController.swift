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
    let manager = RecommendationAPI()
    var genres: [Genre]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        manager.getFeed(from: .genre) { result in
            switch result {
            case .success(let recommendationFeedResult):
                guard let recommendationResults = recommendationFeedResult?.genres else { return }
//                let genre = Genre()
//
//                //recommendationResults.forEach({print($0.name)})
//                genres = [Genre]()
//                genres.append
                
            case .failure(let error):
                print(error)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RecommendationCell
//        print(genres[indexPath.row].name)
//        cell.label.text = genres[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}




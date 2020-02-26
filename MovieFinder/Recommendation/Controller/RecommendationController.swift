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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        print(baseUrl+ListType.genres.rawValue+apiKey+defaultLanguage)
        fetchData(urlString: baseUrl+ListType.genres.rawValue+apiKey+defaultLanguage) { (recommendationFeed: RecommendationFeed) in
            recommendationFeed.genres.forEach({print($0.name)})
            
            
        }
        
        
    }
    
    private func setupTableView() {
        recommendationView.genreTableView.dataSource = self
        recommendationView.genreTableView.delegate = self
    }
    
    fileprivate func fetchData<T: Decodable>(urlString:String, completion: @escaping (T) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
            }catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            
        }.resume()
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}




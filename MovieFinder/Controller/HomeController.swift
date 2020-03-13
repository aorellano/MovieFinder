//
//  SignUpController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/8/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

//List all

final class HomeController: UIViewController {
    let homeView = HomeView()
    let manager = APIManager()
    var cellTouches = 0
    var highlightedTouches = 0
    var keywords = [String]()
    let recommendationVC = RecommendationController()
    var results = [Movie]() {
        didSet {
            print(results.count)
            results.sort { (movie1, movie2) -> Bool in
                return movie1.popularity > movie2.popularity
            }
            recommendationVC.movies = results
        }
    }
    var more = [Movie]()
   
    var genres = [Genre]() {
        didSet {
            homeView.genreTableView.reloadData()
            homeView.genreTableView.scrollToRow(at: [0,0], at: .none, animated: true)
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
        homeView.genreTableView.dataSource = self
        homeView.genreTableView.delegate = self
    }
    

    override func loadView() {
        view = homeView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        homeView.selectButton.isHidden = true
    }
    
    @objc func keywordsSelected() {
        for i in keywords.indices {
            manager.fetchKeywords(.search, with: keywords[i]) { (list: MovieList?, error: Error?) in
                if let error = error {
                    print(error)
                    return
                } else {
                    
                     DispatchQueue.main.async {
                        self.homeView.selectButton.isHidden = false
                        if let list = list {
                            var reducedList = [Movie]()
                            reducedList = Array(Set(list.results))
                            //reducedList.removeAll(where: {$0.title})
                            self.results += reducedList
                            //print(self.results)
                            //print("\(self.arr.count) \(i)")
                            //print("THIS\(self.arr)\(self.arr.count)")
                            
                        }
                    }
                }
            }
        }
      
        self.navigationController?.pushViewController(recommendationVC, animated: true)
    }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! RecommendationCell
        let genresCapitilized = genres.map({$0.name.capitalized})
        cell.label.text = genresCapitilized[indexPath.row]
        
        
    
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RecommendationCell
        cellTouches += 1
        if cellTouches == 1 {
            let query = genres[indexPath.row].name
            manager.fetchKeywords(.keyword, with: query) { (list: KeywordList?, error: Error?) in
                if let error = error {
                    print(error)
                    return
                } else {
                    
                     DispatchQueue.main.async {
                        self.homeView.selectButton.isHidden = false
                        if let list = list {
                            var reducedList = [Genre]()
                            reducedList = Array(list.results)
                            reducedList.removeAll(where: {$0.name.capitalized == query})
                            print(reducedList)
                            self.genres = reducedList
                        }
                    }
                }
            }
        } else {
           
            cell.label.textColor = UIColor.highlightColor
            UIView.animate(withDuration: 0.05, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
            }) { finished in
                UIView.animate(withDuration: 1.0, animations: {
                    cell.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                })
            }
            keywords.append(cell.label.text!)
        }
        
        homeView.selectButton.setTitle("Select (\(keywords.count))", for: .normal)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! RecommendationCell
        cell.label.textColor = .white
        UIView.animate(withDuration: 0.10, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.contentView.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { finished in
            UIView.animate(withDuration: 1.0, animations: {
                cell.contentView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
        }
        keywords.removeAll(where: {$0 == cell.label.text})
        homeView.selectButton.setTitle("Select (\(keywords.count-1))", for: .normal)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = cell as! RecommendationCell
        
        cell.label.textColor = cell.isSelected ? UIColor.highlightColor : UIColor.white

        cell.alpha = 0
        UIView.animate(withDuration: 0.25, delay: 0.04 * Double(indexPath.row), animations:  {
            cell.alpha = 1
        })
    }
}




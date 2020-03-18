//
//  MovieController.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/18/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieController: UIViewController {
    var movieId: Int!
    let movieView = MovieView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(movieId)
    }
    
    override func loadView() {
        view = movieView
    }
}

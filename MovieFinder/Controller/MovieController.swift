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
    var movie: Movie!

    let movieView = MovieView()
    
    var backdropPoster: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        movieView.moviePoster.downloadImage(imageType: .backdrop, path: backdropPoster)
        movieView.movieTitle.text = movie.title
        movieView.movieDescription.text = movie.overview
        movieView.movieRatingLabel.text = "\(String(movie.vote_average))/10"
       
    }
    
    
    
    override func loadView() {
        view = movieView
        
        
    }
}

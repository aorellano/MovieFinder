//
//  MovieCell.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/12/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var moviePoster: UIImageView = {
        let poster = UIImageView()
        poster.backgroundColor = .white
        poster.layer.cornerRadius = 10
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    var movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Title"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.font = UIFont.collectionViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.backgroundColor
        
        setupMovieTitle()
        setupMoviePoster()
        
    }
    
    func setupMoviePoster() {
        addSubview(moviePoster)
        
        moviePoster.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        moviePoster.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        moviePoster.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        moviePoster.bottomAnchor.constraint(equalTo: movieTitle.topAnchor, constant: -5).isActive = true
    }
    
    func setupMovieTitle() {
        addSubview(movieTitle)
        
        movieTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
    
    func setupCell(movie: Movie) {
        let posterPath = movie.poster_path ?? ""
        moviePoster.downloadImage(imageType: .poster, path: posterPath)
        movieTitle.text = movie.title
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


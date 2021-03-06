//
//  MovieCell.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/12/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    var movieContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.backgroundColor
        container.layer.cornerRadius = 10
        container.layer.masksToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    
    var movieImage: ScaleImageView = {
        let imageView = ScaleImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "NoImage")
 
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.backgroundColor
        return imageView
      }()
    
    var movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Title"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .clear
        label.font = UIFont.collectionViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.backgroundColor
        self.layer.cornerRadius = 15
        
        setupMovieTitle()
        setupMoviePoster()
        
    }
    
    func setupMoviePoster() {
        addSubview(movieContainer)
        
        
        movieContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        movieContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        movieContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        movieContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        movieContainer.addSubview(movieImage)
        
        movieImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        
        movieImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true
        
        movieImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -5).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
    
    }
    
    func setupMovieTitle() {
        addSubview(movieTitle)
        
        movieTitle.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
    }
    
    func setupCell(movie: Movie) {
        let posterPath = movie.poster_path ?? ""
      
        movieImage.downloadImage(imageType: .poster, path: posterPath)
        movieTitle.text = movie.title
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


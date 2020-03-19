//
//  MovieView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/18/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieView: UIView {
    
    let posterContainer: UIView = {
        let container = UIView()
        container.backgroundColor = .blue
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let moviePoster: UIImageView = {
        let poster = UIImageView(frame: .zero)
        poster.image = #imageLiteral(resourceName: "NoImage")
        //poster.layer.masksToBounds = true
        poster.contentMode = .scaleAspectFill
        poster.backgroundColor = .blue
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    let descriptionContainer: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor.backgroundColor
        container.layer.cornerRadius = 30
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Title"
        label.font = UIFont.secondaryTitleFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescriptionTitle: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.collectionViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.text = "Overview"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.descriptionFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let actorsTitle: UILabel = {
        let label = UILabel()
        label.text = "Actors"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.collectionViewFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let ratings: UILabel = {
//        let label = UILabel()
//        label.text = "Ratings"
//        label.font = UIFont.collectionViewFont
//        label.textColor = UIColor.highlightColor
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    let date: UILabel = {
//        let label = UILabel()
//        label.text = "Release Date"
//        label.textColor = UIColor.highlightColor
//        label.font = UIFont.collectionViewFont
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    var movieRatingLabel: UILabel = {
         let label = UILabel(frame: .zero)
         label.translatesAutoresizingMaskIntoConstraints = false
         label.textAlignment = .left
         label.font = UIFont.collectionViewFont
        label.textColor = .white
         label.numberOfLines = 1
         label.adjustsFontSizeToFitWidth = true
         label.text = "Ratings"
         return label
     }()
     
//     var movieGenreLabel: UILabel = {
//         let label = UILabel(frame: .zero)
//         label.translatesAutoresizingMaskIntoConstraints = false
//         label.textAlignment = .left
//         label.font = UIFont.collectionViewFont
//        label.textColor = .white
//         label.numberOfLines = 1
//         label.adjustsFontSizeToFitWidth = true
//         label.text = "Genre"
//         return label
//     }()
    
    var starImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var imdbLogo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "IMDB")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
        
        setupPosterContainer()
        setupMoviePoster()
       setupDescriptionContainer()
    
    }
    
    func setupPosterContainer() {
        addSubview(posterContainer)
        posterContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true

        posterContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        posterContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        posterContainer.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -80).isActive = true
    }
    
    func setupMoviePoster() {
        posterContainer.addSubview(moviePoster)



        moviePoster.topAnchor.constraint(equalTo: posterContainer.topAnchor).isActive = true
        moviePoster.bottomAnchor.constraint(equalTo: posterContainer.bottomAnchor).isActive = true

        moviePoster.leadingAnchor.constraint(equalTo: posterContainer.leadingAnchor).isActive = true
        moviePoster.trailingAnchor.constraint(equalTo: posterContainer.trailingAnchor).isActive = true


}
    
    func setupDescriptionContainer() {
        addSubview(descriptionContainer)
        descriptionContainer.topAnchor.constraint(equalTo: centerYAnchor, constant: -110).isActive = true

        descriptionContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        descriptionContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        descriptionContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        descriptionContainer.addSubview(movieTitle)
        
        movieTitle.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 20).isActive = true
//        movieTitle.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor).isActive = true
//        movieTitle.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor).isActive = true
        movieTitle.centerXAnchor.constraint(equalTo: descriptionContainer.centerXAnchor).isActive = true
        
        descriptionContainer.addSubview(imdbLogo)
               
               imdbLogo.heightAnchor.constraint(equalToConstant: 25).isActive = true
               imdbLogo.widthAnchor.constraint(equalToConstant: 50).isActive = true
               imdbLogo.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
               imdbLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50).isActive = true
               
               descriptionContainer.addSubview(starImage)
               
               starImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
               starImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
               starImage.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20).isActive = true
               starImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -75).isActive = true

               
               descriptionContainer.addSubview(movieRatingLabel)
               
        movieRatingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5).isActive = true
        movieRatingLabel.centerYAnchor.constraint(equalTo: starImage.centerYAnchor, constant: 5).isActive = true
        
        descriptionContainer.addSubview(movieDescriptionTitle)
        
        movieDescriptionTitle.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 50).isActive = true
        movieDescriptionTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        descriptionContainer.addSubview(movieDescription)
        
        movieDescription.topAnchor.constraint(equalTo: movieDescriptionTitle.bottomAnchor, constant: 25).isActive = true
        movieDescription.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 20).isActive = true
        movieDescription.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -20).isActive = true
        
        
        
        descriptionContainer.addSubview(actorsTitle)
        
        actorsTitle.topAnchor.constraint(equalTo: movieDescription.bottomAnchor, constant: 50).isActive = true
        actorsTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
       
        
        
        
        
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

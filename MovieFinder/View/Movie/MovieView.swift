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
    
    let moviePoster: ScaleImageView = {
        let poster = ScaleImageView()
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    let descriptionContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

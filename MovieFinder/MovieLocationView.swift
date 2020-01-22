//
//  MovieLocationView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/20/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class MovieLocationView: UIView {
    let movieLocationSymbol: UIImageView = {
        let image = UIImage(named: "LocationSymbol")
        let symbol = UIImageView(image: image)
        symbol.translatesAutoresizingMaskIntoConstraints = false
        return symbol
    }()

    let movieLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Location"
        label.font = UIFont.locationTextFont
        label.textColor = UIColor.secondaryTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.backgroundColor
        translatesAutoresizingMaskIntoConstraints = false
        
        setupMovieLocationView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMovieLocationView() {
        addSubview(movieLocationSymbol)
        movieLocationSymbol.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        movieLocationSymbol.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        movieLocationSymbol.heightAnchor.constraint(equalToConstant: 25).isActive = true
        movieLocationSymbol.widthAnchor.constraint(equalToConstant: 25).isActive = true
    
        addSubview(movieLocationLabel)
        movieLocationLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        movieLocationLabel.leadingAnchor.constraint(equalTo: movieLocationSymbol.trailingAnchor, constant: 10).isActive = true
    }
}

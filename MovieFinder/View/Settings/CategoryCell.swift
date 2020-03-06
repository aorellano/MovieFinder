//
//  HomeMovieCell.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = UIColor.tintColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

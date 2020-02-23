//
//  HomeView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/16/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeView: UIView {
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you feel like watching today?"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.secondaryTitleFont
        label.textColor = UIColor.highlightColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
        positionHeaderLabel()
    }
    
    func positionHeaderLabel() {
        addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

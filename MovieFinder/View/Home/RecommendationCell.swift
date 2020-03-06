//
//  GenreCell.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/22/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecommendationCell: UITableViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.backgroundColor
        addLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20))
        contentView.layer.cornerRadius = 15
        
        contentView.backgroundColor = UIColor.accentColor
        
        
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 1.5, height: 2.5)
        contentView.layer.shadowRadius = 1.0
        contentView.layer.shadowOpacity = 0.20
        
        contentView.layer.masksToBounds = false

    }
    
    func addLabel() {
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

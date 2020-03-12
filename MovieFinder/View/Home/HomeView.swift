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
    
    let genreTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RecommendationCell.self, forCellReuseIdentifier: "cellId")
        tableView.backgroundColor = UIColor.backgroundColor
        tableView.allowsMultipleSelection = true
        tableView.layer.cornerRadius = 30
        //tableView.layer.masksToBounds =
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.tintColor
        button.layer.cornerRadius = 10
        button.setTitle("Select", for: .normal)
        button.addTarget(self, action: #selector(HomeController.keywordsSelected), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.backgroundColor
        positionHeaderLabel()
        positionGenreTableView()
        setupButton()
        
        
    }
    
    func positionHeaderLabel() {
        addSubview(headerLabel)
        
        headerLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
    }
    func positionGenreTableView() {
        addSubview(genreTableView)
        
        genreTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40).isActive = true
        genreTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        genreTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        genreTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setupButton() {
        genreTableView.addSubview(selectButton)

        selectButton.topAnchor.constraint(equalTo: genreTableView.bottomAnchor, constant: 15).isActive = true
        selectButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        selectButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        selectButton.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    

    

    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

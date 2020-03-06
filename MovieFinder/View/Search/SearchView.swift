//
//  HomeView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/20/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchView: UIView {
    var stringAttributes: [NSAttributedString.Key: Any]!

    let accountNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountNameButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        
        button.backgroundColor = .white
        //button.addTarget(self, action: #selector(accountNameButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let searchFieldView = SearchFieldView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = UIColor.backgroundColor
        
        setupAccountNameButton()
        setupSearchFieldView()
    }
    
    func setupSearchFieldView() {
        addSubview(searchFieldView)
        searchFieldView.topAnchor.constraint(equalTo: accountNameButton.bottomAnchor, constant: 10).isActive = true
        searchFieldView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        searchFieldView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25).isActive = true
        searchFieldView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAccountNameButton() {
        addSubview(accountNameButton)
        accountNameButton.addSubview(accountNameLabel)
        accountNameButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        accountNameButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        accountNameButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        accountNameButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        accountNameLabel.centerXAnchor.constraint(equalTo: accountNameButton.centerXAnchor).isActive = true
        accountNameLabel.centerYAnchor.constraint(equalTo: accountNameButton.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  HomeView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/20/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class HomeView: UIView {
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
    
    let movieSegmentedControl: UISegmentedControl = {
        let stringAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 17),
            .foregroundColor: UIColor.white
        ]
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 25),
            .foregroundColor: UIColor.highlightColor
        ]
        let control = UISegmentedControl(items: ["Now Showing", "Upcoming"])
        control.tintColor = .clear
        control.selectedSegmentIndex = 0
        control.setTitleTextAttributes(stringAttributes, for: .normal)
        control.setTitleTextAttributes(selectedAttributes, for: .selected)
        control.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        backgroundColor = UIColor.backgroundColor
        setupAccountNameButton()
        setupSearchFieldView()
        setupMovieSegmentedControl()
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
    
    func setupMovieSegmentedControl() {
        addSubview(movieSegmentedControl)
    
        movieSegmentedControl.removeBorders()
        movieSegmentedControl.topAnchor.constraint(equalTo: searchFieldView.bottomAnchor, constant: 20).isActive = true
        movieSegmentedControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        movieSegmentedControl.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        movieSegmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func handleSegmentedControl() {
        stringAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 25),
            .foregroundColor: UIColor.highlightColor
        ]

        movieSegmentedControl.setTitleTextAttributes(stringAttributes, for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

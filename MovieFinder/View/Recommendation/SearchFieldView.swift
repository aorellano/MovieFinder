//
//  SearchFieldView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 1/20/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class SearchFieldView: UIView {
    let searchField: UITextField = {
        let search = UITextField()
        search.placeholder = "Search"
        search.backgroundColor = UIColor.backgroundColor
        search.textColor = .white
        
        let styleAttributes: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.secondaryTextColor
        ]
        
        let attributedString = NSAttributedString(string: "Search", attributes: styleAttributes)
        search.attributedPlaceholder = attributedString
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    let searchFieldUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = UIColor.backgroundColor
        
        setupSearchFieldView()
    }
    
    func setupSearchFieldView() {
        addSubview(searchFieldUnderline)
        addSubview(searchField)
        
        searchFieldUnderline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        searchFieldUnderline.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1).isActive = true
        searchFieldUnderline.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchFieldUnderline.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        searchField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchField.bottomAnchor.constraint(equalTo: searchFieldUnderline.topAnchor).isActive = true
        searchField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        searchField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

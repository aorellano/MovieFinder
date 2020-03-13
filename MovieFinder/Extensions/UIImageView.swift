//
//  UIImageView.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/12/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//


import UIKit

extension UIImageView {
    static var cache: [URL: UIImage] = [:]
    
    func setStarRating(with rating: Double) {
        var star = #imageLiteral(resourceName: "Home Yellow Star-1")
        if rating < 4 && rating != 0 {
            star = #imageLiteral(resourceName: "Home Red Star-1")
        } else if rating > 7 {
            star = #imageLiteral(resourceName: "Home Green Star-1")
        }
        self.image = star
    }
    
    func downloadImage(imageType: ImageType, path: String) {
        let defaultImage = #imageLiteral(resourceName: "LocationSymbol")
        guard let url = URL(string: imageType.rawValue + path) else {
            print("failed url")
            self.image = defaultImage
            return
        }
        
        if let cached = UIImageView.cache[url] {
            self.image = cached
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [ weak self ] data, response, error in
            
            if let imageData = data, let img = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    UIImageView.cache[url] = img
                    self?.image = img
                    return
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = defaultImage
                }
            }
        }
        task.resume()
    }
}


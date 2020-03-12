//
//  Movie.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/2/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct Movie: Decodable, Equatable, Hashable  {
    let popularity: Double
    let vote_count: Int
    let video: Bool
    let poster_path: String?
    let adult: Bool
    let backdrop_path: String?
    let original_language: String
    let original_title: String
    let genre_ids: [Int]
    let title: String
    let overview: String
    let release_date: String
    
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
    }
}

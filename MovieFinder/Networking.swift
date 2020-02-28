//
//  Networking.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/16/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

let apiKey = "25d3b3b13927672472060f6f5971a50f"
let baseUrl = "https://api.themoviedb.org/3/"



enum ImageType: String {
    case backdrop
    case castImage
    case poster
    
    
    var rawValue: String {
        switch self {
        case .backdrop:
            return "http://image.tmdb.org/t/p/w780"
        case .castImage:
            return "http://image.tmdb.org/t/p/w45"
        default:
            return "http://image.tmdb.org/t/p/w780"
        }
    }
}

enum ListType: String {
    case genres
    case nowPlaying
    case upcoming
    
    var rawValue: String {
        switch self {
        case .genres:
            return "genre/movie/list?api_key="
        case .nowPlaying:
            return "movie/now_playing"
        default:
            return "movie/upcoming"
        }
    }
}

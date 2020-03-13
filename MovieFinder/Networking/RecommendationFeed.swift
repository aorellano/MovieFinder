//
//  MovieFeed.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/28/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

enum RecommendationFeed: String {
    case nowPlaying
    case upcoming
    case popular
    case genre
    case keyword
    case search
}

extension RecommendationFeed: Endpoint {
    var baseURL: URL {
        return URL(string:"https://api.themoviedb.org/3/")!
    }

    var path: String {
        switch self {
        case .nowPlaying: return "movie/now_playing"
        case .upcoming: return "movie/upcoming"
        case .popular: return "movie/popular"
        case .genre: return "genre/movie/list"
        case .keyword: return "search/keyword"
        case .search: return "search/movie"
        }
    }
}

enum ImageType: String {
    case poster
    case backdrop
    case castImage
    
    var rawValue: String {
        switch self {
        case .poster:
            return "http://image.tmdb.org/t/p/w185"
        case .castImage:
            return "http://image.tmdb.org/t/p/w45"
        default:
            return "http://image.tmdb.org/t/p/w780"
        }
    }
}

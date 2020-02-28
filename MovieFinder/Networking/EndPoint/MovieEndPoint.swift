//
//  MovieEndPoint.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/26/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

enum NetworkEnviroment {
    case qa
    case production
    case staging
}

public enum MovieApi {
    case genre(id:Int)
    case recommended(id:Int)
    case popular(page:Int)
    case newMovies(page:Int)
    case video(id:Int)
}

extension MovieApi: EndPointType {
    
    var enviromentBaseURL: String {
        switch NetworkManager.enviroment {
        case .production: return "https://api.themoviedb.org/3/movie/"
        case .qa: return "https://qa.themoviedb.org/3/movie/"
        case .staging: return "https://staging.themoviedb.org/3/movie/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: enviromentBaseURL) else { fatalError("baseURL could not be found")}
        return url
    }
    
    var path: String {
        switch self {
        case .genre(let id):
            return "\(id)/genres"
        case .recommended(let id):
            return "\(id)/recommendations"
        case .popular:
            return "popular"
        case .newMovies:
            return "now_playing"
        case .video(let id):
            return "\(id)/videos"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .newMovies(let page):
            return .requestParameters(bodyParameters: nil, urlParameters: ["page":page,"api_key":NetworkManager.MovieAPIKey])
            
        default:
            return .request
        }
    }
    var headers: HTTPHeaders? {
        return nil
    }

}

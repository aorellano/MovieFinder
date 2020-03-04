//
//  RecommendationAPI.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/28/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class RecommendationAPI: APIManager {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getFeed<T: Decodable>(from recommendationFeedType: RecommendationFeed, completion: @escaping (T?, Error?) -> () ) {
        fetch(with: recommendationFeedType.request, decode: { json -> T in
            let result = json as! T
            return result
        }, completion: completion)
            
    }
}

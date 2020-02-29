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
    
    func getFeed(from recommendationFeedType: RecommendationFeed, completion: @escaping(Result<RecommendationFeedResult?, Error>) -> Void) {
        fetch(with: recommendationFeedType.request, decode: { json -> RecommendationFeedResult? in
            guard let recommendationFeedResult = json as? RecommendationFeedResult else { return nil }
            return recommendationFeedResult
        }, completion: completion)
    }
}

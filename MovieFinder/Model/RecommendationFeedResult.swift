//
//  RecommendationFeedResult.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/2/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct RecommendationFeedResult<T: Decodable>: Decodable {
    let genres: [T]
}

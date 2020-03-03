//
//  RecommendationFeedResult.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/2/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct RecommendationFeedResult: Decodable {
    let genres: [Genre]
    let movies: [Movie]
}

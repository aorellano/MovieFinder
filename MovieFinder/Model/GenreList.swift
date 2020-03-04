//
//  GenreList.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/2/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct GenreList: Decodable {
    static var shared: [Genre]? = nil
    var genres: [Genre]
}

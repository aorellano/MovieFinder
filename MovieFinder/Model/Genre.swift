//
//  Genre.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct Genre {
    let name: String
}

extension Genre: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

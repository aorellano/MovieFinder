//
//  Genre.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

struct Genre: Decodable, Hashable, Equatable {
    let id: Int
    let name: String
    
    static func ==(lhs: Genre, rhs: Genre) -> Bool {
        return lhs.name == rhs.name
    }
}

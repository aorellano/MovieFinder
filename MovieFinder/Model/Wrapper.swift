//
//  Wrapper.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

//A wrapper struct that is of type decodable and requires T to be of type decodable
struct Wrapper<T: Decodable>: Decodable {
    let genres: [T]
}

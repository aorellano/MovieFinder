//
//  ApiResource.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

protocol ApiResource {
    //ModelType can be of any type that conforms to decodable
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension ApiResource {
    var url: URL {
        var components = URLComponents(string: baseUrl)!
        components.path = methodPath
        components.queryItems = [
        URLQueryItem(name: "api_key", value: apiKey),
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "page", value: "1"),
        URLQueryItem(name: "region", value: "US")
        ]
        
        return components.url!
    }
}

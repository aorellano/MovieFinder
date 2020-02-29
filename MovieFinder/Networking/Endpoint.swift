//
//  EndPointType.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/26/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
}

extension Endpoint {
    var apiKey: String {
        return "25d3b3b13927672472060f6f5971a50f"
    }
    
    var urlComponents: URLComponents {
        let baseUrl = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US")
        ]
        print(components)
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}


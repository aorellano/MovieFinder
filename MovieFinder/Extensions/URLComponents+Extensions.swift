//
//  URLComponents+Extensions.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 3/6/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

extension URLComponents {
    
    func addQuery(_ query: String) -> URLComponents {
        var componentsWithQuery = self
        
        if Int(query) != nil {
            componentsWithQuery.queryItems?.append(URLQueryItem(name: "keyword_id", value: query))
        } else {
            componentsWithQuery.queryItems?.append(URLQueryItem(name: "query", value: query))
        }
        
        
        

        

        return componentsWithQuery
    }
}

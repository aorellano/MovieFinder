//
//  RecommendationAPI.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/28/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

class APIManager {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func fetchFeed<T: Decodable>(_ feedType: RecommendationFeed, completion: @escaping (T?, Error?) -> ()) {
        
        let task = session.dataTask(with: feedType.request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                switch (httpResponse.statusCode) {
                case 400...499:
                    completion(nil, error)
                    return
                case 500...599:
                    completion(nil, error)
                    return
                default:
                    break
                }
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(model, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}

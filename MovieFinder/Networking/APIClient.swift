//
//  APIManager.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/28/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit
//class APIClient {
//    var session: URLSession { get }
//    
//    
//    init(configuration: URLSessionConfiguration) {
//            self.session = URLSession(configuration: configuration)
//        }
//    
//        convenience init() {
//            self.init(configuration: .default)
//        }
//    
////    func fetchFeed<T: Decodable>(_ recommendationFeedType: RecommendationFeed, completion: @escaping (T?, Error) -> Void)
//}
//
//extension APIClient {
//    func fetchFeed<T: Decodable>(_ recommendationFeedType: RecommendationFeed, completion: @escaping (T?, Error?) -> Void) {
//        let task = session.dataTask(with: recommendationFeedType.request) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse else {
//                completion(nil, error)
//                return
//            }
//            
//            if httpResponse.statusCode == 200 {
//                if let data = data {
//                    do {
//                        let genericModel = try JSONDecoder().decode(T.self, from: data)
//                        completion(genericModel, nil)
//                    } catch {
//                        completion(nil, error)
//                    }
//                }
//            }
//        }
//    }
//}

//extension APIClient {
//
 
//    fileprivate func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completion: @escaping (Decodable?, (Result<T, Error>)) -> Void) -> URLSessionDataTask {
//        
//        let task = session.dataTask(with: request) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse else {
//                completion(nil, .failure(error!))
//                return
//            }
//            
//            if httpResponse.statusCode == 200 {
//                if let data = data {
//                    do {
//                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
//                        
//                        completion(genericModel, .success(genericModel))
//                    } catch let jsonError {
//                        completion(nil, .failure(jsonError))
//                    }
//                }
//            }
//        }
//        return task
//    }
//    
//    func fetch<T: Decodable>(from recommendationFeedType: RecommendationFeed, with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (T?, Error?) -> ()) {
//        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
//            DispatchQueue.main.async {
//                if let value = decode(json!) {
//                    print(value)
//                }
//            }
//        }
//        task.resume()
//    }
    
    




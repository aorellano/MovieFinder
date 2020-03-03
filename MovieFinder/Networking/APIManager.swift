//
//  APIManager.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/28/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

protocol APIManager {
    var session: URLSession { get }
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping(Decodable) -> T?, completion: @escaping (Result<T, Error>) -> Void)
}

extension APIManager {
    //This function will be the one in charge of parsing or rather decoding the JSON data, it takes a request as
    //a parameter, the type of an object that conforms to Decodable and a completion handler, and it returns
    //a URLSessionDataTask
    fileprivate func decodingTask<T: Decodable>(with request: URLRequest, decodingType: T.Type, completion: @escaping (Decodable?, (Result<T, Error>)) -> Void) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .failure(error!))
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, .success(genericModel))
                    } catch let jsonError {
                        completion(nil, .failure(jsonError))
                    }
                }
            }
        }
        return task
    }
    
    func fetch<T: Decodable>(with request: URLRequest, decode: @escaping (Decodable) -> T?, completion: @escaping (Result<T, Error>) -> Void) {
        let task = decodingTask(with: request, decodingType: T.self) { (json, error) in
            DispatchQueue.main.async {
                
                if let value = decode(json!) {
                    completion(.success(value))
                    print(value)
                }
            }
        }
        task.resume()
    }
}




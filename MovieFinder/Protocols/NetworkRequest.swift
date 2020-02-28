//
//  NetworkRequest.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//


import Foundation
import UIKit
let baseURL = URL(string: baseUrl)!

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func load(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { [weak self] (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(self?.decode(data))
        })
        task.resume()
    }
}

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func load(withCompletion completion: @escaping (UIImage?) -> Void) {
        load(url, withCompletion: completion)
    }
}



class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        let wrapper = try? JSONDecoder().decode(Wrapper<Resource.ModelType>.self, from: data)
        print(wrapper?.genres)
        return wrapper?.genres
    }
    
    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension APIResource {
    var url: URL {
        let base = baseURL.appendingPathComponent(methodPath)
        var urlComponents = URLComponents(url: base, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US")
            ]
 
        print(urlComponents?.url)
        return ((urlComponents?.url)!)
    }
}

struct GenreResourse: APIResource {
    typealias ModelType = Genre
    let methodPath = "genre/movie/list"
}





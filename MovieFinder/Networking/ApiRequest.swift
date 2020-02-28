//
//  ApiRequest.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/25/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import Foundation
import UIKit

//class APIRequest<Resource: APIResource> {
//    let resource: Resource
//    
//    init(resource: Resource) {
//        self.resource = resource
//    }
//}
//
//extension APIRequest: NetworkRequest {
//    func decode(_ data: Data) -> [Resource.ModelType]? {
//        let wrapper = try? JSONDecoder().decode(Wrapper<Resource.ModelType>.self, from: data)
//        return wrapper?.items
//    }
//    
//    func load(withCompletion completion: @escaping ([Resource.ModelType]?) -> Void) {
//        load(resource.url, withCompletion: completion)
//    }
//}

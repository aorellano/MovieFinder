//
//  NetworkRouter.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/26/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

//A NetworkRouter has an endpoint which uses to make requests, Once the request
//is made it passes the response to the completion.
//AssociatedType is used because we want our router to be able to handle
//any endPointType

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

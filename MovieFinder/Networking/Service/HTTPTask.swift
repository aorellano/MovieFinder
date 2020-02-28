//
//  HTTPTask.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/26/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

public typealias HTTPHeaders = [String:String]

//Responsible for configuring parameters for a specific endPoint

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
    
    //case download, upload...etc
}

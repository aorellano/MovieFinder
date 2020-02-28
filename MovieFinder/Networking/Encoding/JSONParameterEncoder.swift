//
//  JSONParameterEncoder.swift
//  MovieFinder
//
//  Created by Alexis Orellano on 2/26/20.
//  Copyright © 2020 Alexis Orellano. All rights reserved.
//

import UIKit

//This struct encodes the parameters to json

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type")  == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        }catch {
            throw NetworkError.encodingFailed
        }
    }
}

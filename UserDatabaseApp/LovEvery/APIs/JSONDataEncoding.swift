//
//  JSONDataEncoding.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

struct JSONDataEncoding {

    // MARK: Private Property

    private static let jsonDataKey = "jsonData"

    // MARK: Static Function

    static func encodingParameters(jsonData: Data?) -> [String: Any]? {
        guard let jsonData = jsonData, !jsonData.isEmpty else {
            return [:]
        }

        var parameters: [String: Any] = [:]
        parameters[jsonDataKey] = jsonData
        return parameters
    }

    // MARK: Public Function

    func encode(_ urlRequest: URLRequest, with parameters: [String: Any]?) -> URLRequest {
        var urlRequest = urlRequest

        guard let jsonData = parameters?[JSONDataEncoding.jsonDataKey] as? Data, !jsonData.isEmpty else {
            return urlRequest
        }

        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        urlRequest.httpBody = jsonData

        return urlRequest
    }
}

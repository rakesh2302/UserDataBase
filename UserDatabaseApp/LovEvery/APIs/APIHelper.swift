//
//  APIHelper.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

// MARK: Enums

enum HTTPMethod: String {
    case get = "GET"
    case head = "HEAD"
    case post = "POST"
    case put = "PUT"
}

enum DecodableRequestBuilderError: Error {
    case nilHTTPResponse
    case unsuccessfullHTTPStatusCode
    case emptyDataResponse
}

enum DownloadException: Error {
    case responseDataMissing
    case responseFailed
    case requestMissingURL
}

// MARK: HTTPURLResponse

extension HTTPURLResponse {

    // MARK: Properties

    var isStatusCodeSuccessFull: Bool {
        return Array(200..<300).contains(statusCode)
    }
}

// MARK: APIHelper

public struct APIHelper {
    public static func mapValueToPathItem(_ source: Any) -> Any {
        if let collection = source as? [Any?] {
            return collection.filter({ $0 != nil }).map({"\($0!)"}).joined(separator: ",")
        }
        return source
    }
}

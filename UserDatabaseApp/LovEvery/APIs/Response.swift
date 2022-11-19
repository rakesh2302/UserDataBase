//
//  Response.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

class Response<T> {

    // MARK: Properties

    var statusCode: Int
    var header: [String: String]
    var body: T?

    // MARK: Initialization

    init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String: String]()

        for (key, value) in rawHeader {
            if let key = key.base as? String,
                let value  = value as? String {
                header[key] = value
            }
        }

        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

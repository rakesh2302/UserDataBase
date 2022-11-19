//
//  ErrorResponse.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

public struct ErrorResponse: Error {

    // MARK: Properties

    let errorCode: Int
    let error: Error
    let response: HTTPURLResponse?
    let data: Data?

    // MARK: Initization

    public init(errorCode: Int,
                error: Error,
                response: HTTPURLResponse? = nil,
                data: Data? = nil) {
        self.errorCode = errorCode
        self.error = error
        self.response = response
        self.data = data
    }

    public init(response: HTTPURLResponse, error: Error, data: Data? = nil) {
        self.init(errorCode: response.statusCode, error: error, response: response, data: data)
    }
}

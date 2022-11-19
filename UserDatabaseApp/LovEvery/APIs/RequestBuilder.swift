//
//  RequestBuilder.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

class RequestBuilder<T> {

    // MARK: Properties

    var urlString: String
    var method: String
    var parameters: [String: Any]?

    // MARK: Initialization

    init(urlString: String, method: String, parameters: [String: Any]?) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
    }

    // MARK: Function

    @discardableResult
    func execute(_ completion: @escaping (_ result: Swift.Result<Response<T>, Error>) -> Void) -> URLSessionDataTask? {
        return nil
    }
}

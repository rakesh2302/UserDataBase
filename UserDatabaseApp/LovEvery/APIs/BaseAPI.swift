//
//  BaseAPI.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Combine
import Foundation

class BaseAPI {

    // MARK: Public static Property

    public static var defaultBasePath = "https://abraxvasbh.execute-api.us-east-2.amazonaws.com"

    // MARK: class Functions

    class func addUser(_ user: User) -> AnyPublisher<Users?, Error> {
        var dataTask: URLSessionDataTask?
        return Deferred {
            Future<Users?, Error>.init { promise in
                dataTask = addUserWithRequestBuilder(user).execute { result -> Void in
                    switch result {
                    case let .success(response):
                        promise(.success(response.body!))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
            .handleEvents(receiveCancel: {
                dataTask?.cancel()
                dataTask = nil
            })
        }
        .eraseToAnyPublisher()
    }

    class func findUsers() -> AnyPublisher<Users?, Error> {
        var dataTask: URLSessionDataTask?
        return Deferred {
            Future<Users?, Error>.init { promise in
                dataTask = findUsersWithRequestBuilder().execute { result -> Void in
                    switch result {
                    case let .success(response):
                        promise(.success(response.body!))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
            .handleEvents(receiveCancel: {
                dataTask?.cancel()
                dataTask = nil
            })
        }
        .eraseToAnyPublisher()
    }

    class func findUsers(by userName: String) -> AnyPublisher<Users?, Error> {
        var dataTask: URLSessionDataTask?
        return Deferred {
            Future<Users?, Error>.init { promise in
                dataTask = findUsersWithRequestBuilder(by: userName).execute { result -> Void in
                    switch result {
                    case let .success(response):
                        promise(.success(response.body!))
                    case let .failure(error):
                        promise(.failure(error))
                    }
                }
            }
            .handleEvents(receiveCancel: {
                dataTask?.cancel()
                dataTask = nil
            })
        }
        .eraseToAnyPublisher()
    }
}

extension BaseAPI {

    // MARK: Private Enum

    private enum Endpoint: String {
        case add = "/proto/messages"
        case get = "/proto/messages/{user}"
    }

    // MARK: Private class Functions

    private class func addUserWithRequestBuilder(_ user: User) -> RequestBuilder<Users> {
        let urlString = defaultBasePath +  Endpoint.add.rawValue
        let parameters = JSONEncodingHelper.encodingParameters(forEncodableObject: user)
        let urlSessionRequestBuilder = UrlSessionRequestBuilder<Users>.init(urlString: urlString,
                                                                             method: HTTPMethod.post.rawValue,
                                                                             parameters: parameters)
        return urlSessionRequestBuilder
    }

    private class func findUsersWithRequestBuilder() -> RequestBuilder<Users> {
        let urlString = defaultBasePath +  Endpoint.add.rawValue
        let urlSessionRequestBuilder = UrlSessionRequestBuilder<Users>.init(urlString: urlString,
                                                                             method: HTTPMethod.get.rawValue,
                                                                             parameters: nil)
        return urlSessionRequestBuilder
    }

    private class func findUsersWithRequestBuilder(by userName: String) -> RequestBuilder<Users> {
        var urlString = defaultBasePath +  Endpoint.get.rawValue
        let userNamePreEscape = "\(APIHelper.mapValueToPathItem(userName))"
        let userNamePostEscape = userNamePreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        urlString = urlString.replacingOccurrences(of: "{user}",
                                                   with: userNamePostEscape,
                                                   options: .literal,
                                                   range: nil)
        let urlSessionRequestBuilder = UrlSessionRequestBuilder<Users>.init(urlString: urlString,
                                                                             method: HTTPMethod.get.rawValue,
                                                                             parameters: nil)
        return urlSessionRequestBuilder
    }
}

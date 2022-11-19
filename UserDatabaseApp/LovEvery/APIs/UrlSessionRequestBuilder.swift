//
//  UrlSessionRequestBuilder.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

class UrlSessionRequestBuilder<T: Decodable>: RequestBuilder<T> {

    // MARK: override Function

    override func execute(_ completion: @escaping (Result<Response<T>, Error>) -> Void) -> URLSessionDataTask? {
        let urlSession = URLSession(configuration: .default)

        guard let method = HTTPMethod(rawValue: method) else {
            fatalError("Unsupported Http method - \(method)")
        }

        do {
            let  urlRequest = try createURLRequest(urlSession: urlSession, method: method)
            let dataTask = urlSession.dataTask(with: urlRequest) { data, response, error in
                DispatchQueue.main.async {
                    self.processRequestResponse(urlRequest: urlRequest,
                                                data: data,
                                                response: response,
                                                error: error,
                                                completion: completion)
                }
            }

            dataTask.resume()

            return dataTask
        } catch {
            DispatchQueue.main.async {
                completion(.failure(ErrorResponse(errorCode: 400, error: error)))
            }

            return nil
        }
    }
}

extension UrlSessionRequestBuilder {

    // MARK: Private Functions

    private func createURLRequest(urlSession: URLSession,
                                  method: HTTPMethod) throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw DownloadException.requestMissingURL
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let encoding = JSONDataEncoding()
        let modifiedRequest = encoding.encode(urlRequest, with: parameters)
        return modifiedRequest
    }

    private func processRequestResponse(urlRequest: URLRequest?,
                                        data: Data?,
                                        response: URLResponse?,
                                        error: Error?,
                                        completion: @escaping (_ result: Swift.Result<Response<T>, Error>)
                                        -> Void) {
        if let error = error {
            completion(.failure(ErrorResponse(errorCode: -1,
                                              error: error)))
            return
        }

        guard let httpResponse  = response as? HTTPURLResponse else {
            completion(.failure(ErrorResponse(errorCode: -2,
                                              error: DecodableRequestBuilderError.nilHTTPResponse)))
            return
        }

        guard httpResponse.isStatusCodeSuccessFull else {
            completion(.failure(ErrorResponse(errorCode: -3,
                                              error: DecodableRequestBuilderError.unsuccessfullHTTPStatusCode)))
            return
        }

        switch T.self {
        case is String.Type:
            let body = data.map { String(data: $0, encoding: .utf8) }
            completion(.success(Response<T>(response: httpResponse, body: body as? T)))

        case is Void.Type:
            completion(.success(Response(response: httpResponse, body: nil)))

        default:
            guard let data = data, !data.isEmpty else {
                completion(.failure(ErrorResponse(response: httpResponse,
                                                  error: DecodableRequestBuilderError.emptyDataResponse)))
                return
            }

            let decodeResult = CodableHelper.decode(T.self, from: data)

            switch decodeResult {
            case let .success(decodableObj):
                completion(.success(Response(response: httpResponse, body: decodableObj)))
            case let .failure(error):
                completion(.failure(ErrorResponse(response: httpResponse, error: error, data: data)))
            }
        }
    }
}

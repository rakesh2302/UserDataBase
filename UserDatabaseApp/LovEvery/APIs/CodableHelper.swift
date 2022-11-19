//
//  CodableHelper.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import UIKit

class CodableHelper {

    // MARK: Class Function

    class func encode<T>(_ value: T) -> Swift.Result<Data, Error> where T: Encodable {
        return Swift.Result { try self.jsonEncoder.encode(value) }
    }

    class func decode<T>(_ type: T.Type, from data: Data) -> Swift.Result<T, Error> where T: Decodable {
        return Swift.Result { try self.jsonDecoder.decode(type, from: data) }
    }
}

extension CodableHelper {

    // MARK: Private Properties

    private static var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
         encoder.outputFormatting = .prettyPrinted
         return encoder
    }()

    private static var jsonDecoder: JSONDecoder = {
        var jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
}

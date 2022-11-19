//
//  JSONEncodingHelper.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

class JSONEncodingHelper {

    // MARK: Class Function

    class func encodingParameters<T: Encodable>(forEncodableObject encodableObj: T?) -> [String: Any]? {
        guard let encodableObj = encodableObj else {
                  return [:]
              }

        var parameters: [String: Any]?
        let encodeResult = CodableHelper.encode(encodableObj)

        do {
            let data  = try encodeResult.get()
            parameters = JSONDataEncoding.encodingParameters(jsonData: data)
        } catch {
            print(error.localizedDescription)
        }
        return parameters
    }
}

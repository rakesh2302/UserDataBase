//
//  Users.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

public struct Users: Codable, Hashable {

    // MARK: Public Properties

    public var statusCode: Int?
    public var body: String?
    public var userList: [String: [User]]?

    // MARK: Public Initialization

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        statusCode = try container.decode(Int.self, forKey: CodingKeys.statusCode)
        body = try container.decode(String.self, forKey: CodingKeys.body)
        setup()
    }

    public init(_ statusCode: Int?,
                body: String?,
                userList: [String: [User]]?) {
        self.statusCode = statusCode
        self.body = body
        self.userList = userList
    }
}

extension Users {

    // MARK: Private enum

    private enum CodingKeys: CodingKey {
        case statusCode
        case body
    }

    // MARK: Private  Function

    mutating private func setup() {
        guard let data = body?.data(using: .utf8) else {
            return
        }

        let decodeResult = CodableHelper.decode(Body.self, from: data)
        userList = [String: [User]]()

        switch decodeResult {
        case let .success(decodableObj):
            userList = decodableObj.userList
        default:
            break
        }
    }
}

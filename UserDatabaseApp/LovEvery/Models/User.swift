//
//  User.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

public struct User: Codable, Hashable {

    // MARK: Public Properties

    public var user: String?
    public var operation: String?
    public var subject: String?
    public var message: String?
    public var userName: String?

    // MARK: Private Property

    private let uuid = UUID()

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        for key in container.allKeys {
            switch key.stringValue {
            case CodingKeys.user.stringValue:
                user = try container.decode(String.self, forKey: CodingKeys.user)
            case CodingKeys.operation.stringValue:
                operation = try container.decode(String.self, forKey: CodingKeys.operation)
            case CodingKeys.subject.stringValue:
                subject = try container.decode(String.self, forKey: CodingKeys.subject)
            case CodingKeys.message.stringValue:
                message = try container.decode(String.self, forKey: CodingKeys.message)
            default:
                break
            }
        }
        userName = container.codingPath.first!.stringValue
    }

    // MARK: Public Initialization

    public init(user: String?,
                operation: String?,
                subject: String?,
                message: String?,
                userName: String?) {
        self.user = user
        self.operation = operation
        self.subject = subject
        self.message = message
        self.userName = userName
    }

    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

extension User {

    // MARK: Private Enum

    private enum CodingKeys: CodingKey {
        case user
        case operation
        case subject
        case message
    }
}

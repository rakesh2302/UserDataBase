//
//  Body.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Foundation

public struct Body: Codable, Hashable {

    // MARK: Public Properties

    public var userList: [String: [User]]?
    public var user: String?
    public var message: [String: [User]]?

    private struct CustomCodingKeys: CodingKey {
        var stringValue: String
        var intValue: Int?

        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        init?(intValue: Int) {
            return nil
        }
    }

    // MARK: Public Initialization

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CustomCodingKeys.self)

        userList = [String: [User]]()
        var findUsers = [User]()

        for key in container.allKeys {
            switch key.stringValue {
            case CodingKeys.user.stringValue:
                user = try container.decode(String.self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
            case CodingKeys.message.stringValue:
                let value = try container.decode([User].self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
                findUsers = value
            default:
                let value = try container.decode([User].self, forKey: CustomCodingKeys(stringValue: key.stringValue)!)
                userList?[key.stringValue] = value
            }
        }
        
        if findUsers.count > 0,
            let user = user {
            userList?[user] = findUsers
        }
    }
}

extension Body {

    // MARK: Private Enum

    private enum CodingKeys: CodingKey {
        case user
        case message
    }
}

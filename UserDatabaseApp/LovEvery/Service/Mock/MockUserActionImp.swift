//
//  MockUserActionImp.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

import Combine

class MockUserActionImp: UserAction {

    // MARK: Functions

    func addUser(_ user: User) -> AnyPublisher<Users?, Error> {
        let user = User(user: nil,
                        operation: "add_message",
                        subject: "Mock Subject",
                        message: "Mock Message. This is is test message. This is test message.",
                        userName: "Jack")
        let userList = ["Jack" : [user]]
        let users = Users(200, body: nil, userList: userList)

        return Just(users)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func findUsers() -> AnyPublisher<Users?, Error> {
        let firstUser = User(user: nil,
                        operation: "add_message",
                        subject: "Mock Subject",
                        message: "Mock Message. This is is test message. This is test message.",
                        userName: "Jack")
        let secondUser = User(user: nil,
                        operation: "add_message",
                        subject: "Mock Subject",
                        message: "Mock Message. This is is test message. This is test message.",
                        userName: "Rohan")
        let userList = ["Jack" : [firstUser],
                        "Rohan" : [secondUser]]

        let users = Users(200, body: nil, userList: userList)
        return Just(users)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func findUsers(by userName: String) -> AnyPublisher<Users?, Error> {
        let user = User(user: nil,
                        operation: "add_message",
                        subject: "Mock Subject",
                        message: "Mock Message. This is is test message. This is test message.",
                        userName: "Jack")
        let userList = ["Jack" : [user]]
        let users = Users(200, body: nil, userList: userList)
        return Just(users)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

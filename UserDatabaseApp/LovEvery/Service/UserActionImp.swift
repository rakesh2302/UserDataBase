//
//  UserActionImp.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Combine

class UserActionImp: UserAction {

    // MARK: Functions

    func addUser(_ user: User) -> AnyPublisher<Users?, Error> {
        return BaseAPI.addUser(user)
            .eraseToAnyPublisher()
    }

    func findUsers() -> AnyPublisher<Users?, Error> {
        return BaseAPI.findUsers()
            .eraseToAnyPublisher()
    }

    func findUsers(by userName: String) -> AnyPublisher<Users?, Error> {
        return BaseAPI.findUsers(by: userName)
            .eraseToAnyPublisher()
    }
}

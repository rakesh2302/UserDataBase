//
//  UserAction.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Combine

protocol UserAction {

    // MARK: Interface

    func addUser(_ user: User) -> AnyPublisher<Users?, Error>
    func findUsers() -> AnyPublisher<Users?, Error>
    func findUsers(by userName: String) -> AnyPublisher<Users?, Error>
}

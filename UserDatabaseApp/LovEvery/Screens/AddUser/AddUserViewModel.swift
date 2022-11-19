//
//  AddUserViewModel.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Resolver
import Combine
import Foundation

class AddUserViewModel {

    // MARK: Dependency

    @Injected var userAction: UserAction

    // MARK: Functions

    func addUser(_ user: User) -> AnyPublisher<Users?, Never> {
        userAction.addUser(user)
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func getUser(from userName: String?, subject: String?, message: String?) -> User {
        User(user: userName,
             operation: "add_message",
             subject: subject,
             message: message,
             userName: nil)
    }
}

//
//  AvailableUsersViewModel.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Resolver
import Combine
import Foundation

class AvailableUsersViewModel {

    // MARK: Dependency

    @Injected var userAction: UserAction

    // MARK: Property

    var userName: String?

    // MARK: Functions

    func getMessages() -> AnyPublisher<Users?, Never> {
        setupSearch()
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

    func setup(userName: String?) {
        self.userName = userName
    }

    func isUserNamePresent() -> Bool {
        return userName != nil
    }
}

extension AvailableUsersViewModel {
    private func setupSearch() -> AnyPublisher<Users?, Error> {
        guard let userName = userName else {
            return userAction.findUsers()
        }

        return userAction.findUsers(by: userName)
    }
}

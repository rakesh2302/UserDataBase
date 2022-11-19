//
//  AvailableUsers+DI.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    static func registerAvailableUsersUI() {
        registerAvailableUsersScreen()
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerAvailableUsersScreen() {
        register { AvailableUsersScreen() }
        .scope(.unique)

        register { AvailableUsersViewModel() }
        .scope(.unique)
    }
}

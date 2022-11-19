//
//  AddUser+DI.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    static func registerAddUserUI() {
        registerAddUserScreen()
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerAddUserScreen() {
        register { AddUserScreen() }
        .scope(.unique)

        register { AddUserViewModel() }
        .scope(.unique)
    }
}

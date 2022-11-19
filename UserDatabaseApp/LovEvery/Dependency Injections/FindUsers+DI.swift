//
//  FindUsers+DI.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    static func registerFindUserUI() {
        registerFindUserScreen()
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerFindUserScreen() {
        register { FindUserScreen() }
        .scope(.unique)
    }
}

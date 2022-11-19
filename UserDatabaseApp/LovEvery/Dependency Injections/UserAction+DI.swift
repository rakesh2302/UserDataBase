//
//  UserAction+DI.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/23/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    static func registerUserActionServices() {
        registerUserAction()
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerUserAction() {
        register { UserActionImp() }
        .implements(UserAction.self)
        .scope(.unique)
    }
}

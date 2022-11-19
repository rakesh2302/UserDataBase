//
//  UserActionMock+DI.swift
//  LoveEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    static func registerMockUserActionServices() {
        registerMockUserAction()
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerMockUserAction() {
        register { MockUserActionImp() }
        .implements(UserAction.self)
        .scope(.unique)
    }
}

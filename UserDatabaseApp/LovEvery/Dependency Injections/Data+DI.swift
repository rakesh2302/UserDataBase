//
//  Data+DI.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import Resolver

extension Resolver {

    // MARK: Static Functions

    public static func registerServices(environment: Environment) {
        registerDataServices(isMock: environment == .mock)
    }
}

extension Resolver {

    // MARK: Private Static Functions

    private static func registerDataServices(isMock: Bool) {
        registerAddUserUI()
        registerFindUserUI()
        registerAvailableUsersUI()

        if isMock {
            registerMockDataService()
        } else {
            registerNonMockDataService()
        }

    }

    private static func registerNonMockDataService() {
        registerUserActionServices()
    }
    
    private static func registerMockDataService() {
        registerMockUserActionServices()
    }

}

//
//  BaseAppLoader.swift
//  LovEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

import Resolver

public enum Environment {
    case mock
    case dev
    case prod
}

class BaseAppLoader {

    // MARK: Class Function

    class func load() {
        print("")
#if MOCK
        Resolver.registerServices(environment: Environment.mock)
#else
        Resolver.registerServices(environment: Environment.dev)
#endif
    }
}

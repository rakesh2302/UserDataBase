//
//  AppDelegate.swift
//  LovEvery
//
//  Created by Rakesh Shetty on 9/24/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Function

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
                     launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        BaseAppLoader.load()
        return true
    }
}

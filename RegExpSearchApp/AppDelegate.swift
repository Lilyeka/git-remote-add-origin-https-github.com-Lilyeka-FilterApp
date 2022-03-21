//
//  AppDelegate.swift
//  RegExpSearchApp
//
//  Created by Лилия Левина on 21.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow()
        self.window?.rootViewController =
        UINavigationController(rootViewController: SearchViewController())
        self.window?.makeKeyAndVisible()
        return true
    }
}


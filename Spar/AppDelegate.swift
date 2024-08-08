//
//  AppDelegate.swift
//  Spar
//
//  Created by Алексей Гвоздков on 08.08.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = ShopViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


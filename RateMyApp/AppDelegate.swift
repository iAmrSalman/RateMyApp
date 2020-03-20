//
//  AppDelegate.swift
//  RateMyApp
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2019 Amr Salman. All rights reserved.
//

import UIKit
import RateMyApp_iOS
import RateMyAppUIKit
import RateMyAppKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let injectionContainer = AppDependencyContainer()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        UINavigationBar.appearance().barTintColor = .cyan
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = nil
        
        let mainVC = injectionContainer.makeMainViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainVC
        return true
    }
}

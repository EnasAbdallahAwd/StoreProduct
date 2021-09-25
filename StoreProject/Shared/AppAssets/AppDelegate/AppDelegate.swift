//
//  AppDelegate.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupNavigationController()
        return true
    }
    
    
    private func setupNavigationController() {
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.tintColor = #colorLiteral(red: 0.03529411765, green: 0.05882352941, blue: 0.2156862745, alpha: 1)
        let textAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor:  UIColor.black,
//            .font: UIFont.getLocalizedFont(type: .bold(20)),
            
        ]
        navigationBarAppearance.titleTextAttributes = textAttributes
        UIBarButtonItem.appearance().setTitleTextAttributes(textAttributes, for: .normal)
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowColor = .clear
        navBarAppearance.titleTextAttributes = textAttributes
        navBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.standardAppearance = navBarAppearance
        navigationBarAppearance.scrollEdgeAppearance = navBarAppearance
        UITabBar.appearance().shadowImage = UIImage(named: "orange")
        UITabBar.appearance().isTranslucent = false
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


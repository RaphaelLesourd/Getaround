//
//  AppDelegate.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import UIKit
import Kingfisher

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        kingFisherCacheSetup()
        return true
    }

    /// Setup Kingfisher cache
        private func kingFisherCacheSetup() {
            let cache = ImageCache.default
            cache.memoryStorage.config.countLimit = 150
            cache.memoryStorage.config.totalCostLimit = 500 * 1024 * 1024
            cache.diskStorage.config.sizeLimit = 1000 * 1024 * 1024
            KingfisherManager.shared.downloader.downloadTimeout = 3000.0
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}

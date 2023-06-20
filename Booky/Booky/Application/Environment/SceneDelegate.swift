//
//  SceneDelegate.swift
//  Booky
//
//  Created by J.E on 2023/05/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        UserDefaultsManager.bookIDs = Set(UserDefaults.standard.stringArray(forKey: "UserBooks") ?? [])
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        UserDefaults.standard.set(Array(UserDefaultsManager.bookIDs), forKey: "UserBooks")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }

}


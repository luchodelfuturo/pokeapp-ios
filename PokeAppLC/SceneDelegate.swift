//
//  SceneDelegate.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 17/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        let homeViewController = PokemonListViewController()
        let navigationController = UINavigationController(rootViewController: homeViewController)
        window = UIWindow(windowScene: windowsScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}


//
//  SceneDelegate.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit
import Alamofire

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var flowCoordinator: IFlowCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        flowCoordinator = FlowCoordinator(window: window)
        flowCoordinator?.start()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreData.shared.saveContext()
    }
}

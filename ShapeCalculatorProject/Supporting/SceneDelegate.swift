//
//  SceneDelegate.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 16.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: Setting View Controllers
        let window = UIWindow(windowScene: windowScene)
        let triangleVC = TriangleController()
        let circleVC = CircleController()
        let sealVC = SealController()
        
        
        // MARK: Setting NavigationViewControllers
        let triangleNavVC = UINavigationController(rootViewController: triangleVC)
        let triangleTabBarItem = UITabBarItem(title: "Triangle", image: .init(systemName: "triangle.fill"), tag: 0)
        triangleNavVC.tabBarItem = triangleTabBarItem
        triangleNavVC.tabBarController?.tabBar.backgroundColor = .white
        triangleNavVC.loadView()
        
        let circleNavVC = UINavigationController(rootViewController: circleVC)
        let circleTabBarItem = UITabBarItem(title: "Circle", image: .init(systemName: "circle.fill"), tag: 1)
        circleNavVC.tabBarItem = circleTabBarItem
        circleNavVC.tabBarController?.tabBar.backgroundColor = .white
        circleNavVC.loadView()
        
        let sealNavVC = UINavigationController(rootViewController: sealVC)
        let sealTabBarItem = UITabBarItem(title: "Custom", image: .init(systemName: "seal.fill"), tag: 2)
        sealNavVC.tabBarItem = sealTabBarItem
        sealNavVC.tabBarController?.tabBar.backgroundColor = .black
        
        
        // MARK: Setting TabBarController
        let tabBarVC = UITabBarController()
        tabBarVC.tabBar.unselectedItemTintColor = .systemGray
        tabBarVC.setViewControllers([triangleNavVC, circleNavVC, sealNavVC], animated: true)
        tabBarVC.selectedViewController = triangleNavVC
        
        
        // MARK: UIWindow settings
        self.window = window
        window.rootViewController = tabBarVC
        window.backgroundColor = .white
        window.tintColor = .systemOrange
        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

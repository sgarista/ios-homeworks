import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)


        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())


        let tabBarController = UITabBarController()


        feedNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "list.bullet.below.rectangle"), tag: 0)


        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), tag: 1)


        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]

        tabBarController.selectedIndex = 0

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()

        self.window = window

        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

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


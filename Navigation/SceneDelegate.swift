import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: scene)


        let feedNavigationController = UINavigationController(rootViewController: FeedViewController())
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())


        let tabBarController = UITabBarController()

        UINavigationBar.appearance().backgroundColor = .white
        UITabBar.appearance().backgroundColor = .white

        feedNavigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "list.bullet.below.rectangle"), tag: 0)


        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle"), tag: 1)


        tabBarController.viewControllers = [feedNavigationController, profileNavigationController]

        tabBarController.selectedIndex = 0

        let rootViewController = ViewController()
        rootViewController.view.backgroundColor = .white
        rootViewController.addChild(tabBarController)
        rootViewController.view.addSubview(tabBarController.view)
        tabBarController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tabBarController.view.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            tabBarController.view.topAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.topAnchor),
            tabBarController.view.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor),
            tabBarController.view.bottomAnchor.constraint(equalTo: rootViewController.view.bottomAnchor)
        ])


        window.rootViewController = rootViewController
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


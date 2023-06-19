//
//  MainTabBarController.swift
//  MyProject
//
//  Created by Саша Восколович on 15.06.2023.
//


/// The main tab bar controller for the app.
import UIKit

class MainTabBarController: UITabBarController {
    
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        
        // Set the appearance of the tab bar
        setTabBarAppearance()
    }
    
    // Generate the tab bar with view controllers
    private func generateTabBar() {
        
        // Configure the view controllers for the tab bar
        viewControllers = [
            generateViewController(
                viewController: MainPageController(),
                title: "Main page",
                image: UIImage(systemName: "house")
            ),
            generateViewController(
                viewController: UsersInformationController(),
                title: "Users Info",
                image: UIImage(systemName: "list.bullet")
            )
        ]
        
    }
    
    // Helper method to generate a view controller with a tab bar item
    private func generateViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        
        // Set the title and image for the tab bar item
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    // Set the appearance of the tab bar
    private func setTabBarAppearance() {
        tabBar.itemPositioning = .automatic
        tabBar.tintColor = .tabBarItemColor
        tabBar.unselectedItemTintColor = .tabBarItemLight
        
    }
}



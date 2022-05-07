//
//  RootTabBarController.swift
//  WeatherReport
//
//  Created by AP Yauheni Levin on 8.05.21.
//

import UIKit

class RootTabBarController: UITabBarController {

    private struct ScreenInfo {
        let title: String
        let image: String
        let selectedImage: String
        let color = Color.tabBarColor
    }
    
    private struct Color {
        let selected: UIColor
        let deselected: UIColor
        let background: UIColor
        
        static var tabBarColor: Self {
            let selected = UIColor.selectedTabBarItem
            let deselected = UIColor.deselectedTabBarItem
            let background = UIColor.mainBackground
            return .init(selected: selected, deselected: deselected, background: background)
        }
    }
    
    private lazy var mainScreen: UIViewController = {
        let screenInfo = ScreenInfo(title: "Current", image: "home", selectedImage: "home")
        return customiseScreen(viewController: MainViewController(), screenInfo: screenInfo)
    }()
    
    private lazy var favoritesSreen: UIViewController = {
        let screenInfo = ScreenInfo(title: "Saved", image: "star", selectedImage: "star")
        return customiseScreen(viewController: FavoritesViewController(), screenInfo: screenInfo)
    }()
    
    private lazy var settingsScreen: UIViewController = {
        let screenInfo = ScreenInfo(title: "Settings", image: "settings", selectedImage: "settings")
        return customiseScreen(viewController: SettingsViewController(), screenInfo: screenInfo)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension RootTabBarController {
    private func configure() {
        viewControllers = [mainScreen, favoritesSreen, settingsScreen]
        tabBar.isTranslucent = false
        tabBar.barTintColor = Color.tabBarColor.background
        tabBar.tintColor = Color.tabBarColor.selected
        tabBar.unselectedItemTintColor = Color.tabBarColor.deselected
    }
    
    private func customiseScreen(viewController: UIViewController, screenInfo: ScreenInfo) -> UIViewController {
        viewController.tabBarItem.image = UIImage(named: screenInfo.image)
        viewController.tabBarItem.selectedImage =  UIImage(named: screenInfo.image)
        viewController.tabBarItem.title = screenInfo.title
        return UINavigationController(rootViewController: viewController)
    }
}

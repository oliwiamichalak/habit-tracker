//
//  TabBarController.swift
//  HabitTracker
//
//  Created by Oliwia Michalak on 06/10/2020.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createMainNC(), createNewAimNC()]

    }
    
    func createMainNC() -> UINavigationController {
        let mainVC = MainViewController()
        mainVC.title = "Your habits"
        mainVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        
        return UINavigationController(rootViewController: mainVC)
    }
    
    func createNewAimNC() -> UINavigationController {
        let valdation = ValidationService()
        let newAimVC = NewAimViewController(validation: valdation)
        newAimVC.title = "Create new goal"
        newAimVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        return UINavigationController(rootViewController: newAimVC)
    }
}

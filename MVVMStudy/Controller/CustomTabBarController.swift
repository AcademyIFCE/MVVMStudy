//
//  CustomTabBarController.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit


class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponents()
    }
    fileprivate func setComponents() {
        viewControllers = [
                            createNavigation(viewController: CharacterViewController() , title: "Characters", imageName: "Character"),
                            createNavigation(viewController: HousesViewController(), title: "Houses", imageName: "House")
        ]
    }
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigation:UINavigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarController?.tabBar.tintColor = .yellow
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
}

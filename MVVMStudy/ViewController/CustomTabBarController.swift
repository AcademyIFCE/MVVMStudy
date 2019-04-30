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
                            createNavigation(viewController: EpisodeViewController(), title: "Episode", imageName: "Episode")
                          ]
    }
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navigation:UINavigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        viewController.view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        navigation.tabBarController?.tabBar.backgroundColor = .black
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageName)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
}

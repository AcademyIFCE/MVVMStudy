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
        tabBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
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
        navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.00539229624, green: 0.6875012517, blue: 0.792283237, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Get Schwifty", size: 40)!]
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.00539229624, green: 0.6875012517, blue: 0.792283237, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Get Schwifty", size: 28)!]
        navigation.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        navigation.tabBarController?.tabBar.backgroundColor = .black
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageName)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
}

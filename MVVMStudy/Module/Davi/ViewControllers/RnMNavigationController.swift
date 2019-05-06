//
//  RnMNavigationController.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class RnMNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let feedController = FeedViewController()
        pushViewController(feedController, animated: true)
    }
}

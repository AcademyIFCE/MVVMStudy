//
//  NavigationViewController.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import UIKit

class ELNavigationViewController: UINavigationController {

    lazy var mainViewController: ELCharsViewController = {
        let mainViewController = ELCharsViewController.init()

        return mainViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.prefersLargeTitles = true

        pushViewController(mainViewController, animated: true)
    }
}

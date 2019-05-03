//
//  BaseCellViewModel.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class BaseCellViewModel {

    private let project: Project
    private weak var controller: UIViewController?

    var title: String {
        return project.name
    }

    init(controller: UIViewController, project: Project) {
        self.project = project
        self.controller = controller
    }

    func cellWasPressed() {
        let destinationController = project.destination.init()
        controller?.present(destinationController, animated: true, completion: nil)
    }

}

//
//  RnMSegmentedControl.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class RnMSegmentedControl: UISegmentedControl {

    convenience init(titles: String...) {
        self.init(items: titles)
        selectedSegmentIndex = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}

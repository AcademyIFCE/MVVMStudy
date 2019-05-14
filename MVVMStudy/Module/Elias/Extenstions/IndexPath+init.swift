//
//  IndexPath+init.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element == IndexPath {
    init(withRangeOfRows rangeOfRows: Range<Int>, andSectionPosition sectionPosition: Int = 0) {
        self.init()

        for rowPosition in rangeOfRows {
            let indexPath = IndexPath.init(row: rowPosition, section: sectionPosition)

            append(indexPath)
        }
    }
}

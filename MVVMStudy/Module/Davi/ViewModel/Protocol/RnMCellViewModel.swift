//
//  RnMCellViewModel.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import CoreGraphics

protocol RnMCellViewModel: class {
    var name: String { get }
    
    static func sizeForCellFrom(_ rect: CGRect) -> CGSize
}

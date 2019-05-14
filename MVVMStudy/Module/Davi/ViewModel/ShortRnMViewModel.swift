//
//  ShortRnMViewModel.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import CoreGraphics

class ShortRnMViewModel: RnMCellViewModel {
    private let char: Character

    var name: String {
        return char.name
    }

    init(char: Character) {
        self.char = char
    }

    static func sizeForCellFrom(_ rect: CGRect) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

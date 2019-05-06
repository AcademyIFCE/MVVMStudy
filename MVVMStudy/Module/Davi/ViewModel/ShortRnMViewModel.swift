//
//  ShortRnMViewModel.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class ShortRnMViewModel: RnMCellViewModel {
    
    private let char: Character

    var name: String {
        return char.name
    }
    
    init(char: Character) {
        self.char = char
    }
}

//
//  CharacterViewModel.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 28/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class CharacterViewModel {
    let name: String?
    let gender: String?
    let culture: String?
    let birthDate: String?
    init(character: Characters) {
        self.name = character.name
        self.gender = character.gender
        self.culture = character.culture
        self.birthDate = character.birthDate
    }
}

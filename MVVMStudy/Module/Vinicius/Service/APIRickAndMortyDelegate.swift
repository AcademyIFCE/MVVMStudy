//
//  APIRickAndMortyDelegate.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 29/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

protocol APIRickAndMortyDelegate: class {
    func getCharacter(name: String,
                      page: String,
                      completion: @escaping ([Character]?, Info?) -> Void)
}

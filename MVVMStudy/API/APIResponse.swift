//
//  APIResponse.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

protocol APIResponse {
    associatedtype Model
    var info: Info { get set }
    var results: [Model] { get set }
}

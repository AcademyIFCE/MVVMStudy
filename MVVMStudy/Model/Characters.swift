//
//  Characters.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit
struct Characters: Decodable {
    var name: String?
    var gender: String?
    var culture: String?
    var birthDate: String?
    var allegiances: [String]?
    var house: String?
    var titles: [String]?
    var aliases: [String]?
    var mother: String?
    var father: String?
    var spouse: String?
    var playedBy: [String]?
    var imageUrl: URL?
}

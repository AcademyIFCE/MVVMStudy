//
//  RickAndMortyAPIClient.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 29/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import CoreData
enum RickAndMortyAPI {
    case character(name: String, page: String)
    case charactersWith(ids: String)
    case episode(name: String, page: String)
    
}

extension RickAndMortyAPI  {
    var baseUrl: URL {
        guard let url = URL(string: "https://rickandmortyapi.com/api") else {
            fatalError("Base URL could not be configured")
        }
        return url
    }
    var path: String {
        switch self {
        case .character:
            return "/character"
        case .charactersWith(let ids):
            return "/character/\(ids)"
        case .episode:
            return "/episode"
        }
    }
}

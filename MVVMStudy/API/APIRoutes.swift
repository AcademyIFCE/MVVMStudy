//
//  Routes.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

enum APIRoutes {

    typealias Parameters = [APIParametersKeys: String]

    case character(Parameters?)
    case location(Parameters?)
    case episode(Parameters?)

    private var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }

    var endpoint: String {
        let route: String
        let params: Parameters?
        switch self {
        case .character(let apiParams):
            route = "character"
            params = apiParams
        case .location(let apiParams):
            route = "location"
            params = apiParams
        case .episode(let apiParams):
            route = "episode"
            params = apiParams
        }

        let baseEndpoint = "\(baseURL)\(route)"

        return formatUrl(endpoint: baseEndpoint, parameters: params)!.absoluteString
    }
    private func formatUrl(endpoint: String, parameters: Parameters?) -> URL? {
        var urlComponent = URLComponents(string: endpoint)
        urlComponent?.queryItems = parameters?.map({ (key,value) -> URLQueryItem in
            URLQueryItem(name: key.rawValue, value: value)
        })
        return urlComponent?.url
    }
}

enum APIParametersKeys: String {
    case name
    case status
    case species
    case type
    case gender
}

enum APIStatusValues: String, CustomStringConvertible {
    case alive
    case dead
    case unknown

    var description: String {
        return rawValue
    }
}

enum APIGenderValues: String, CustomStringConvertible {
    case female
    case male
    case genderless
    case unknown

    var description: String {
        return rawValue
    }
}

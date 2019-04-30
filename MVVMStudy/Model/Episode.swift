//
//  Episode.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 29/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

struct EpisodeResponse: Decodable {
    let info: Info
    let results: [Episode]
}

struct Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
    func characterIds() -> String {
        var ids = ""
        for characterUrl in characters {
            if let index = characterUrl.range(of: "character/")?.upperBound {
                let characterIdSubString = (characterUrl[index...])
                let characterId = String(characterIdSubString)
                ids.append(characterId + ",")
            }
        }
        return ids
    }
}

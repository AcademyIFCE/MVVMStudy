//
//  EpisodeViewModel.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 30/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class EpisodeViewModel {
    let ide: Int
    let name: String
    let airDate: String

    init(episode: Episode) {
        self.name = episode.name
        self.ide = episode.id
        self.airDate = episode.airDate
    }
}

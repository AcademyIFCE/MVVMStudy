//
//  FeedViewModel.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

protocol FeedViewModelDelegate: class {
    func viewModelFinishLoading()
}

class FeedViewModel {

    private var characters: [Character] = []
    private weak var delegate: FeedViewModelDelegate?
    
    var numberOfCells: Int {
        return characters.count
    }
    
    func viewModelForCell(_ item: Int) -> RnMCellViewModel {
        let char = characters[item]
        return ShortRnMViewModel(char: char)
    }
    
    init(delegate: FeedViewModelDelegate) {
        self.delegate = delegate
        let provider = APIProvider<CharacterResponse>()
        provider.data(from: .character(nil)) { (response, error) in
            self.characters = response?.results ?? []
            self.delegate?.viewModelFinishLoading()
        }
    }
}

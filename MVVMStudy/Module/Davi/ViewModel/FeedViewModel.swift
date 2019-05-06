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
    func refreshView()
}

class FeedViewModel {

    private var isShortPresented = false {
        didSet {
            delegate?.refreshView()
        }
    }
    private var characters: [Character] = []
    private weak var delegate: FeedViewModelDelegate?
    
    var numberOfCells: Int {
        return characters.count
    }
    
    var cellIdentifier: String {
        return isShortPresented ? ShortRnMCollectionViewCell.cellIdentifier : LongRnMCollectionViewCell.cellIdentifier
    }
    
    init(delegate: FeedViewModelDelegate) {
        self.delegate = delegate
        let provider = APIProvider<CharacterResponse>()
        provider.data(from: .character(nil)) { (response, error) in
            self.characters = response?.results ?? []
            self.delegate?.viewModelFinishLoading()
        }
    }
    
    func sizeForCell(from rect: CGRect) -> CGSize {
        return isShortPresented ? ShortRnMViewModel.sizeForCellFrom(rect) : LongRnMViewModel.sizeForCellFrom(rect)
    }
    
    func viewModelForCell(_ item: Int) -> RnMCellViewModel {
        let char = characters[item]
        return isShortPresented ? ShortRnMViewModel(char: char) : LongRnMViewModel(char: char)
    }
    
    func presentationStyleChanged(_ isShortPresented: Bool) {
        self.isShortPresented = isShortPresented
    }
}

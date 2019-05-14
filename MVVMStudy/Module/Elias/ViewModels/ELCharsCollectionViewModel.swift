//
//  ELCharsViewModel.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class ELCharsCollectionViewModel {
    private var charsCollection = ELCharCollection.init()

    var charsViewModels: [ElCharViewModel] = []

    var dataInsertionCompletion: ((Range<Int>) -> Void)?

    var numberOfChars: Int {
        return charsCollection.chars.count
    }

    func needMoreChars() {
        let provider = APIProvider<CharacterResponse>()

        guard let nextPage = charsCollection.nextPage else {
            return
        }

        provider.data(from: .character([.page: "\(nextPage)"])) { (response, error) in

            guard error == nil else {
                return
            }

            if let newCharsRange = self.charsCollection.useData(fromResponse: response) {

                self.insertNewViewModels(inRange: newCharsRange)

                DispatchQueue.main.async {
                    self.dataInsertionCompletion?(newCharsRange)
                }
            }
        }
    }

    func insertNewViewModels(inRange range: Range<Int>) {
        range.forEach { [weak self] (index) in
            let char = charsCollection.chars[index]
            let charViewModel = ElCharViewModel.init(withChar: char)

            self?.charsViewModels.append(charViewModel)
        }
    }

    func charViewModelAtPosition(_ position: Int) -> ElCharViewModel {
        let charViewModel = self.charsViewModels[position]

        return charViewModel
    }
}

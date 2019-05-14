//
//  ELCharPage.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class ELCharCollection {
    var chars: [Character] = []
    var currentPage: Int = 1
    var numberOfPages: Int?

    var nextPage: Int? {
        if let numberOfPages = self.numberOfPages, currentPage <= numberOfPages {
            return currentPage
        } else {
            return currentPage
        }
    }

    func useData(fromResponse response: CharacterResponse?) -> Range<Int>? {

        let oldCharsCount = chars.count

        if let chars = response?.results {
            self.chars += chars
            self.numberOfPages = response?.info.pages
            self.currentPage += 1

            let newCharsCount = self.chars.count

            return oldCharsCount..<newCharsCount
        }

        return nil
    }
}

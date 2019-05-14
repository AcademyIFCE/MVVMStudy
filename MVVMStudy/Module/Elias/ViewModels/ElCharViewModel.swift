//
//  ElCharViewModel.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation

class ElCharViewModel {

    private var char: Character

    var imageLoadedCompletion: ((URL?) -> Void)?

    var name: String {
        return char.name
    }

    init(withChar char: Character) {
        self.char = char
    }

    func needLoadImage() {
        let imageProvider = APIImageProvider.init()

        imageProvider.data(from: char.image) { (url, _) in
            if let imageUrl = url {
                DispatchQueue.main.async {
                    self.imageLoadedCompletion?(imageUrl)
                }
            }
        }
    }
}

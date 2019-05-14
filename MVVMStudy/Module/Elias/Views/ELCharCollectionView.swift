//
//  ELCharCollectionView.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import UIKit

class ELCharCollectionView: UICollectionView {

    var margin: CGFloat = 0.0

    convenience init(withCharCellID charCellID: String, andMargin margin: CGFloat) {
        let charsCollectionLayout = UICollectionViewFlowLayout.init()
        charsCollectionLayout.scrollDirection = .vertical

        self.init(frame: CGRect.zero, collectionViewLayout: charsCollectionLayout)

        self.margin = margin
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clear

        register(
            ELCharCollectionViewCell.self,
            forCellWithReuseIdentifier: charCellID
        )
    }

    override func didMoveToSuperview() {
        guard let superView = self.superview else {
            return
        }

        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(
                equalTo: superView.leftAnchor,
                constant: margin
            ),
            self.rightAnchor.constraint(
                equalTo: superView.rightAnchor,
                constant: -margin
            ),
            self.topAnchor.constraint(
                equalTo: superView.layoutMarginsGuide.topAnchor,
                constant: margin
            ),
            self.bottomAnchor.constraint(
                equalTo: superView.layoutMarginsGuide.bottomAnchor,
                constant: -margin
            )
        ])
    }
}

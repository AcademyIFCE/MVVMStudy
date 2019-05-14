//
//  RickyAndMortyCollectionView.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class RickyAndMortyCollectionView: UICollectionView {

    convenience init() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .vertical
        self.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white

        //Register de células
        register(ShortRnMCollectionViewCell.self, forCellWithReuseIdentifier: ShortRnMCollectionViewCell.cellIdentifier)
        register(LongRnMCollectionViewCell.self, forCellWithReuseIdentifier: LongRnMCollectionViewCell.cellIdentifier)
    }
}

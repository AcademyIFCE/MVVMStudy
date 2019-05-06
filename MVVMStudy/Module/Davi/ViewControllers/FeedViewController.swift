//
//  FeedViewController.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var collectionView: RickyAndMortyCollectionView = {
       let collection = RickyAndMortyCollectionView()
        return collection
    }()
    
    private var viewModel: FeedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.viewModel = FeedViewModel(delegate: self)
    }
}

extension FeedViewController: FeedViewModelDelegate {
    func viewModelFinishLoading() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfCells ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortRnMCollectionViewCell.cellIdentifier, for: indexPath) as? RnMCell, let vm = viewModel else {
            fatalError()
        }
        let cellViewModel = vm.viewModelForCell(indexPath.row)
        cell.setup(with: cellViewModel)
        return cell
    }
}

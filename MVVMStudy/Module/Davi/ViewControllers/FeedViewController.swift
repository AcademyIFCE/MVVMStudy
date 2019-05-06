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
        view.addSubview(collection)
        return collection
    }()
    
    private lazy var segmentedControl: RnMSegmentedControl = {
        let segmented = RnMSegmentedControl(titles: "Short", "Long")
        view.addSubview(segmented)
        return segmented
    }()
    
    private var viewModel: FeedViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.viewModel = FeedViewModel(delegate: self)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate(
            [
                
                segmentedControl.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
                segmentedControl.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
                segmentedControl.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
                
                collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 8),
                collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
                collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8)
            ]
        )
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel?.sizeForCell(from: view.bounds) ?? .zero
    }
}

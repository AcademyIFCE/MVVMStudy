//
//  CharsViewController.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class ELCharsViewController: UIViewController {

    var viewModel = ELCharsCollectionViewModel()

    lazy var rightBarButtonItem: UIBarButtonItem = {
        let rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dismissController)
        )

        return rightBarButtonItem
    }()

    lazy var charsCollectionView: UICollectionView = {
        let charsCollectionView = ELCharCollectionView.init(
            withCharCellID: Constants.charsCellID,
            andMargin: Constants.collectionViewMargin
        )

        charsCollectionView.delegate = self
        charsCollectionView.dataSource = self

        return charsCollectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupViewModel()
    }

    func setupView() {
        navigationItem.rightBarButtonItem = rightBarButtonItem
        view.backgroundColor = UIColor.white
        title = Constants.title

        self.view.addSubview(charsCollectionView)
    }

    func setupViewModel() {
        viewModel.dataInsertionCompletion = { [weak self] newCharsPositionsRange in
            let indexPathForNewChars = [IndexPath].init(withRangeOfRows: newCharsPositionsRange)

            self?.charsCollectionView.insertItems(at: indexPathForNewChars)
        }

        viewModel.needMoreChars()
    }

    @objc private func dismissController() {

        dismiss(animated: true, completion: nil)
    }
}

extension ELCharsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfChars
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.charsCellID,
            for: indexPath
        )
        
        if let charCell = cell as? ELCharCollectionViewCell {
            let charViewModel = viewModel.charViewModelAtPosition(indexPath.row)

            charCell.setup(withViewModel: charViewModel)
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        let height = width * Constants.charsCellAspectRatio

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        let numberOfChars = viewModel.numberOfChars

        if indexPath.row == numberOfChars - 2 {
            viewModel.needMoreChars()
        }
    }
}

private enum Constants {
    static let charsCellID = "charsCell"
    static let collectionViewMargin: CGFloat = 5
    static let charsCellAspectRatio: CGFloat = 0.7
    static let title = "Characters"
}

//
//  ELCharCollectionViewCell.swift
//  MVVMStudy
//
//  Created by Elias Paulino on 09/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import Foundation
import UIKit

class ELCharCollectionViewCell: UICollectionViewCell {

    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init()

        titleLabel.text = Constants.placeHolderLabelText
        titleLabel.backgroundColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.white
        titleLabel.layer.cornerRadius = 15
        titleLabel.clipsToBounds = true
        titleLabel.textAlignment = .center

        return titleLabel
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init()

        imageView.image = UIImage.init(named: Constants.placeHolderImageName)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true

        return imageView
    }()

    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 15)
        ])
    }

    override func didMoveToSuperview() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }

    func setup(withViewModel viewModel: ElCharViewModel) {
        titleLabel.text = viewModel.name
        imageView.image = UIImage.init(named: Constants.placeHolderImageName)

        viewModel.imageLoadedCompletion = { imageURL in
            if let imageURL = imageURL {
                self.imageView.image = UIImage.init(url: imageURL)
            }
        }

        viewModel.needLoadImage()
    }
}

private enum Constants {
    static let placeHolderImageName = "placeholder"
    static let placeHolderLabelText = "Loading..."
}

//
//  ShortRnMCollectionViewCell.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 06/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class ShortRnMCollectionViewCell: UICollectionViewCell, RnMCellProtocol {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .yellow

        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
    }

    func setup(with viewModel: RnMCellViewModel) {
        nameLabel.text = viewModel.name
    }
}

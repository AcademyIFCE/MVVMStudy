//
//  HousesCollectionViewCell.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    lazy var imageHouse: UIImageView = {
       let image = UIImageView(image: UIImage(named: "launch"))
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    lazy var nameHouse: UILabel = {
        let label = UILabel()
        label.text = "Prelude"
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.textColor = #colorLiteral(red: 0.00539229624, green: 0.6875012517, blue: 0.792283237, alpha: 1)
        return label
    }()
    lazy var descriptionHouse: UILabel = {
        let label = UILabel()
        label.text = "This is the best EPISODE"
        label.font = UIFont(name: "Get Schwifty", size: 28)
        label.textColor = #colorLiteral(red: 0.00539229624, green: 0.6875012517, blue: 0.792283237, alpha: 1)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.2875465547, green: 0.333238863, blue: 0.3964435902, alpha: 1)
        self.layer.cornerRadius = 8
        setComponents()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var topConstraint: NSLayoutConstraint!
    fileprivate func setComponents() {
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageHouse)
        imageHouse.centerInSuperview(size: .init(width: self.frame.width - 40, height: self.frame.height - 110))
        let stackView = UIStackView(arrangedSubviews: [nameHouse, descriptionHouse, imageContainerView])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        self.topConstraint.isActive = true
    }
}

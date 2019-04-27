//
//  HousesCollectionViewCell.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class HousesCollectionViewCell: UICollectionViewCell {
    lazy var imageHouse: UIImageView = {
       let image = UIImageView(image: UIImage(named: "HouseMock"))
        return image
    }()
    
    lazy var nameHouse: UILabel = {
        let label = UILabel()
        label.text = "STARK"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    lazy var descriptionHouse: UILabel = {
        let label = UILabel()
        label.text = "Winter is Coming"
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        setComponents()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var topConstraint: NSLayoutConstraint!
    fileprivate func setComponents() {
        imageHouse.contentMode = .scaleAspectFill
        imageHouse.clipsToBounds = true
        
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageHouse)
        imageHouse.centerInSuperview(size: .init(width: 240, height: 240))
        
        let stackView = UIStackView(arrangedSubviews: [nameHouse, descriptionHouse, imageContainerView])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
        
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 30)
        self.topConstraint.isActive = true
        
    }
    
}



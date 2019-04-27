//
//  CharacterTableViewCell.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    lazy var imageCharacter: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    lazy var nameCharacter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setComponentsInCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setComponentsInCell() {
        addSubview(imageCharacter)
        addSubview(nameCharacter)
        imageCharacter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        nameCharacter.leadingAnchor.constraint(equalToSystemSpacingAfter: imageCharacter.leadingAnchor, multiplier: 7).isActive = true
    }
    
}

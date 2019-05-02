//
//  CharacterTableViewCell.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    var charactersViewModel: CharacterViewModel! {
        didSet{
            nameCharacter.text = charactersViewModel.name
            cultureCharacter.text = charactersViewModel.gender
        }
    }
    lazy var imageCharacter: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 75).isActive = true
        image.heightAnchor.constraint(equalToConstant: 75).isActive = true
        image.clipsToBounds = true
        return image
    }()
    lazy var nameCharacter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Get Schwifty", size: 24)
        return label
    }()
    lazy var cultureCharacter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Get Schwifty", size: 16)
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
        addSubview(cultureCharacter)
        nameCharacter.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameCharacter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        cultureCharacter.topAnchor.constraint(equalTo: nameCharacter.bottomAnchor, constant: 2).isActive = true
        cultureCharacter.leadingAnchor.constraint(equalTo: nameCharacter.leadingAnchor, constant: 7).isActive = true
        imageCharacter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        imageCharacter.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: self.topAnchor, multiplier: 2).isActive = true
    }
}

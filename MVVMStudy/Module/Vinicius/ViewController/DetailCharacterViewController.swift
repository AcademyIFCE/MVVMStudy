//
//  DetailCharacterViewController.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 03/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit
import CoreData

class DetailCharacterViewController: UIViewController {
    public var character: Character!
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var status: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var species: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var buttonFavorite: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heartNormal"), for: .normal)
        button.addTarget(self, action: #selector(favoriteCharacter), for: .touchUpInside)
        return button
    }()

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        setupUI()
        setNavigationItems()
        setDataInComponents()
    }
    fileprivate func setupUI() {
        view.addSubview(name)
        view.addSubview(status)
        view.addSubview(species)
        view.addSubview(image)
        image.addSubview(buttonFavorite)
        setConstraints()
    }

    fileprivate func setConstraints() {
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2)).isActive = true
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15).isActive = true
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15).isActive = true
        status.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        species.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 15).isActive = true
        species.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        buttonFavorite.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -10).isActive = true
        buttonFavorite.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10).isActive = true
    }
    fileprivate func setDataInComponents() {
        image.sd_setImage(with: URL(string: character.image))
        name.text = "Name: \(character.name)"
        species.text = "Specie: \(character.species)"
        status.text = "Status: \(character.status)"
    }
    fileprivate func setNavigationItems() {
        navigationItem.title = character.name
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backToController))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.00539229624, green: 0.6875012517, blue: 0.792283237, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Get Schwifty", size: 28)!] // Later create extension to improve this part of code, to follow the solid.
    }

    @objc fileprivate func favoriteCharacter() {
        buttonFavorite.setImage(UIImage(named: "heartSelected"), for: .normal)
        character.isFavorite = true
    }
    @objc fileprivate func backToController() {
        dismiss(animated: true, completion: nil)
    }
}

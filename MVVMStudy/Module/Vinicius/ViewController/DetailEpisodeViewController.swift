//
//  DetailEpisodeViewController.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 04/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class DetailEpisodeViewController: UIViewController {
    public var episode: Episode!
    lazy var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "launch"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var airDate: UILabel = {
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
        button.addTarget(self, action: #selector(favoriteEpisode), for: .touchUpInside)
        return button
    }()
    
    lazy var created: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0.8592078792, blue: 1, alpha: 1)
        label.font = UIFont(name: "Get Schwifty", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        setUIComponents()
        setEpisodeDate()
    }
    fileprivate func setUIComponents() {
        view.addSubview(image)
        view.addSubview(name)
        view.addSubview(airDate)
        view.addSubview(created)
        setConstraints()
    }
    
    fileprivate func setEpisodeDate() {
        name.text = "PILOT"
        airDate.text = "SQ1EQ1"
        created.text = "20/02/2015"
    }
    
    fileprivate func setConstraints() {
        image.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height/2)).isActive = true
        name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15).isActive = true
        name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        airDate.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15).isActive = true
        airDate.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        created.topAnchor.constraint(equalTo: airDate.bottomAnchor, constant: 15).isActive = true
        created.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    }
    @objc fileprivate func favoriteEpisode() {
        
    }
}

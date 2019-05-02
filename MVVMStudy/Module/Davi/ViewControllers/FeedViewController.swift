//
//  FeedViewController.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let provider = APIProvider<CharacterResponse>()
        provider.data(from: .character(nil)) { (response, error) in
            response?.results.forEach { print($0.name) }
        }
    }
}

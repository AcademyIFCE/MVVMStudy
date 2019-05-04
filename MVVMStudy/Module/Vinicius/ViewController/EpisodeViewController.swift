//
//  HousesViewController.swift
//  MVVMStudy
//
//  Created by Vinicius Mangueira Correia on 27/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class EpisodeViewController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout{

    var episodes =  [Episode]()

    lazy var activity: UIActivityIndicatorView = {
       let act = UIActivityIndicatorView(style: .whiteLarge)
        act.translatesAutoresizingMaskIntoConstraints = false
        act.startAnimating()
        return act
    }()
    fileprivate let cellId: String = "HousesCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        setupActivity()
        fetchEpisodes()
    }
    fileprivate func setupActivity() {
        view.addSubview(activity)
        activity.centerInSuperview()
    }
    fileprivate func fetchEpisodes() {
        let provider = APIProvider<EpisodeResponse>()
        provider.data(from: .episode(nil)) { (episodes, error) in
            if let err = error {
                print("Error requested",err)
            }
            guard let episodes = episodes?.results else {return}
            self.episodes = episodes
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if episodes.count != 0 {activity.stopAnimating()}
        return episodes.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? EpisodeCollectionViewCell
        cell?.episode = episodes[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 400)
    }
}

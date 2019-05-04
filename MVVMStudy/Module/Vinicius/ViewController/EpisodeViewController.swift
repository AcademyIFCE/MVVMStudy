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
    var startingFrame: CGRect?
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailEpisodeVC = DetailEpisodeViewController()
        let viewDetail =  detailEpisodeVC.view
        viewDetail?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveView)))
        view.addSubview(viewDetail!)
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
        viewDetail?.frame = startingFrame
        view.layer.cornerRadius = 16
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            viewDetail?.frame = self.view.frame
        }, completion: (nil))
        detailEpisodeVC.episode = self.episodes[indexPath.row]
    }
    @objc fileprivate func handleRemoveView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
        })
    }
}

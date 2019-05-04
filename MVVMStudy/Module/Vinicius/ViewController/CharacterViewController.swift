//
//  ViewController.swift
//  MVVMStudy
//
//  Created by Yuri on 26/04/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class CharacterViewController: UITableViewController, UISearchBarDelegate {
    fileprivate let cellId = "characterCellId"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    var charactersViewModel = [CharacterViewModel]()
    var characters = [Character]()

    lazy var activity: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: .whiteLarge)
        act.translatesAutoresizingMaskIntoConstraints = false
        act.startAnimating()
        return act
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        self.tableView.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        self.tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: cellId)
        setupSearchBar()
        fetchCharacters()
        setupIndicator()
    }

    fileprivate func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.barStyle = .blackOpaque
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {}

    fileprivate func fetchCharacters() {
        let provider = APIProvider<CharacterResponse>()
        provider.data(from: .character(nil)) { (response, err) in
            if let error = err {
                print("Fatal Error in API", error)
                return
            }
            guard let results = response?.results else {return}
            self.characters = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    fileprivate func setupIndicator() {
        view.addSubview(activity)
        activity.centerInSuperview()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell
        let detailView = DetailCharacterViewController()
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
             let navDetail = UINavigationController(rootViewController: detailView)
             self.present(navDetail, animated: true, completion: nil)
            detailView.character = self.characters[indexPath.row]
        }, completion: (nil))
        cell?.characters = self.characters[indexPath.row]
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if characters.count == 0{
            self.tableView.separatorStyle = .none
        } else {
            self.tableView.separatorStyle = .singleLine
            activity.stopAnimating()
        }
        return self.characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CharacterTableViewCell
        cell?.characters = self.characters[indexPath.row]
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}

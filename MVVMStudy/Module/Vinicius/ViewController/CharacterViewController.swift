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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1843137255, green: 0.2117647059, blue: 0.2509803922, alpha: 1)
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: cellId)
        setupSearchBar()
        fetchCharacters()
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
            response?.results.forEach { print($0.image) }
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell
        cell?.characters = self.characters[indexPath.row]
        let colorCell = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        if cell?.backgroundColor == colorCell {
            cell?.backgroundColor = .white
        } else {
            cell?.backgroundColor = colorCell
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
}

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
    var charactersViewModel = [Character]()
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {}
    
    fileprivate func fetchCharacters() {
        Service.shared.getCharacter(name: "", page: "") { (res, info) in
            self.charactersViewModel = res!
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell
        let colorCell = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        if cell?.backgroundColor == colorCell {
            cell?.backgroundColor = .white
        } else {
            cell?.backgroundColor = colorCell
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charactersViewModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CharacterTableViewCell
        cell?.charactersViewModel = charactersViewModel[indexPath.row]
        return cell ?? UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

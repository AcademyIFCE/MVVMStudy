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
    fileprivate func fetchCharacters() {
        Service.shared.fetchCharacthers { (character, err) in
            if let error = err {
                print("Fatal Error", error)
                return
            }
            
            print(character.first?.name)
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? CharacterTableViewCell
        if cell?.backgroundColor == .red {
            cell?.backgroundColor = .white
        } else {
            cell?.backgroundColor = .red
        }
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CharacterTableViewCell
        cell?.imageCharacter.image = UIImage(named: "JonMock")
        cell?.nameCharacter.text = "Jon Snow"
        return cell ?? UITableViewCell()
    }
}


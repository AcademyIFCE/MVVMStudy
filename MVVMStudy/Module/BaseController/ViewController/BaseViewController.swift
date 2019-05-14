//
//  BaseViewController.swift
//  MVVMStudy
//
//  Created by Davi Cabral on 02/05/19.
//  Copyright © 2019 academy.IFCE. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(table)
        return table
    }()

    private var cellViewModels: [BaseCellViewModel] = [] {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        var projects = [Project]()
        projects.append( Project(name: "Vinícius", destination: CustomTabBarController.self) )
        projects.append( Project(name: "Davi", destination: RnMNavigationController.self) )
        projects.append( Project.init(name: "Elias", destination: ELNavigationViewController.self))

        cellViewModels = projects.map { BaseCellViewModel(controller: self, project: $0) }

        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let viewModel = cellViewModels[indexPath.row]
        cell.textLabel?.text = viewModel.title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = cellViewModels[indexPath.row]
        viewModel.cellWasPressed()
    }
}

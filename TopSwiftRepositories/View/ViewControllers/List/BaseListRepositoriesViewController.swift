//
//  TopListRepositoriesViewController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 14/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit

class BaseListRepositoriesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: "repositoryCell")
    }
    
    func setupNavigationBar() {
        title = "Top Repositories"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}

extension BaseListRepositoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RepositoryCell()
        cell.configure(repository: TopListRepositoriesModel.Repository(name: "Thiago Cavalcante", stargazersCount: 10, owner: TopListRepositoriesModel.Owner(login: "thiago.cavalcante15@hotmail.com", avatarUrl: "https://avatars2.githubusercontent.com/u/484656?v=4")))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


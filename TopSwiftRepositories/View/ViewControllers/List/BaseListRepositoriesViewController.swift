//
//  TopListRepositoriesViewController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 14/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit

class BaseListRepositoriesViewController: UITableViewController, BaseDisplayLogic {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationBar()
        showScreenLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RepositoryCell.self, forCellReuseIdentifier: "repositoryCell")
    }
    
    func setupNavigationBar() {
        title = String.topListRepositoriesTitle
    }
        
}

extension BaseListRepositoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryCell()
        cell.configure(viewModel: TopListRepositoriesModel.RepositoryCellViewModel(repository: TopListRepositoriesModel.Repository(name: "TopSwiftRepositories", stargazersCount: 1000, owner: TopListRepositoriesModel.Owner(login: "thiagoCO", avatarUrl: ""))))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}


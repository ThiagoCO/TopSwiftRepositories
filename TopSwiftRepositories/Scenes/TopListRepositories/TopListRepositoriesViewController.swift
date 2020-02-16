//
//  TopListRepositoryViewController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit
import PromiseKit

class TopListRepositoriesViewController: BaseListRepositoriesViewController {

    var list: TopListRepositoriesModel.Response?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView =  LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 50)) 
        TopListRepositoriesWorker().searchRepositories(page: 1).done { list in
            self.list = list
            self.tableView.reloadData()
        }.catch { error in
            print(error)
        }
    }

}

extension TopListRepositoriesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.repositories?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryCell()
        cell.configure(repository: list!.repositories![indexPath.row])
        return cell
    }
}

//
//  TopListRepositoryViewController.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import UIKit
import PromiseKit

protocol TopListRepositoriesDisplayLogic: class {
    func displayScreenLoading()
    func hideScreenLoading()
    func displayPaginationLoading()
    func hidePaginationLoading()
    func displayRepositories(_ repositoriesCellsViewModel: [TopListRepositoriesModel.RepositoryCellViewModel])
    func displayError(title: String, subtitle: String)
}

class TopListRepositoriesViewController: BaseListRepositoriesViewController {
    
    var interactor: ListRepositoriesBusinessLogic?
    var repositoriesCellsViewModel: [TopListRepositoriesModel.RepositoryCellViewModel] = []
    
    private let customRefreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.requestRepositories()
    }
    
    override func loadView() {
        super.loadView()
        setup()
        setupPullRefresh()
    }
    
    private func setup() {
        let viewController = self
        let interactor = TopListRepositoriesInteractor()
        let presenter = TopListRepositoriesPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func setupPullRefresh() {
        refreshControl = customRefreshControl
        refreshControl?.addTarget(self, action: #selector(pullToRefreshAction), for: .valueChanged)
    }
    
    @objc
    private func pullToRefreshAction() {
        interactor?.refreshRequestRepositories()
    }
    
}

extension TopListRepositoriesViewController: TopListRepositoriesDisplayLogic {
    
    func displayRepositories(_ repositoriesCellsViewModel: [TopListRepositoriesModel.RepositoryCellViewModel]) {
        self.repositoriesCellsViewModel = repositoriesCellsViewModel
        refreshControl?.endRefreshing()
        if repositoriesCellsViewModel.count <= 30 {
            tableView.setContentOffset(CGPoint(x: 0, y: -200), animated:true)
        }
        tableView.reloadData()
    }
    
    func displayScreenLoading() {
        showScreenLoading()
    }
    
    func hideScreenLoading() {
        removeLoadingState()
    }
    
    func displayPaginationLoading() {
        tableView.tableFooterView =  LoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    }
    
    func hidePaginationLoading() {
        tableView.tableFooterView = nil
    }
    
    func displayError(title: String, subtitle: String) {
        showError(title: title, message: subtitle)
    }
    
}

extension TopListRepositoriesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoriesCellsViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RepositoryCell()
        cell.configure(viewModel: repositoriesCellsViewModel[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        interactor?.fetchMore(index: indexPath.row)
    }
}

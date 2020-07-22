//
//  TopListRepositoriesInteractor.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

protocol ListRepositoriesBusinessLogic {
    func requestRepositories()
    func fetchMore(index: Int)
    func refreshRequestRepositories()
    func didSelectRow(index: Int)
}

protocol ListRepositoriesDataStore {
    var selectedItem: TopListRepositoriesModel.Repository? { get set }
}

class TopListRepositoriesInteractor: ListRepositoriesDataStore, ListRepositoriesBusinessLogic {
    var presenter: TopListRepositoriesPresentationLogic?
    var worker: TopListRepositoriesNetworkLogic
    var repositoryList: TopListRepositoriesModel.Response?
    var nextPage = 1
    var selectedItem: TopListRepositoriesModel.Repository?
    
    init(worker: TopListRepositoriesNetworkLogic = TopListRepositoriesWorker()) {
        self.worker = worker
    }
    
    func requestRepositories() {
        displayLoading()
        worker.searchRepositories(page: nextPage)
            .done(handleSuccess)
            .catch(handleError)
            .finally { self.removeLoading() }
    }
    
    private func handleSuccess(response: TopListRepositoriesModel.Response) {
        if nextPage == 1 {
            repositoryList = response
        } else {
            guard let newRepositories = response.repositories else { return }
            repositoryList?.repositories?.append(contentsOf: newRepositories)
        }
        nextPage = nextPage + 1
        presenter?.presentListRepositories(repositories: repositoryList?.repositories)
    }
    
    func refreshRequestRepositories() {
        nextPage = 1
        requestRepositories()
    }
    
    private func handleError(error: Error) {
        presenter?.presentError(title: String.titleAlertError, subtitle: String.subTitleAlertError)
    }
    
    private func displayLoading() {
        nextPage == 1 ? presenter?.presentScreenLoading() : presenter?.presentPaginationLoading()
    }
    
    private func removeLoading() {
        presenter?.hidePaginationLoading()
        presenter?.hideScreenLoading()
    }
    
    func fetchMore(index: Int) {
        guard let repositoriesCount = repositoryList?.repositories?.count else { return }
        if index == repositoriesCount - 1 {
            requestRepositories()
        }
    }
    
    func didSelectRow(index: Int) {
        guard let item = repositoryList?.repositories?[index] else { return }
        selectedItem = item
        presenter?.presentPullRequests()
    }
}


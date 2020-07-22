//
//  TopListRepositoryPresenter.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

protocol TopListRepositoriesPresentationLogic {
    func presentListRepositories(repositories: [TopListRepositoriesModel.Repository]?)
    func presentScreenLoading()
    func hideScreenLoading()
    func presentPaginationLoading()
    func hidePaginationLoading()
    func presentError(title: String, subtitle: String)
    func presentPullRequests()
}

class TopListRepositoriesPresenter: TopListRepositoriesPresentationLogic {
    
    weak var viewController: TopListRepositoriesDisplayLogic?
    
    func presentListRepositories(repositories: [TopListRepositoriesModel.Repository]?) {
        guard let repositories = repositories else { return }
        let repositoryViewModelCell: [TopListRepositoriesModel.RepositoryCellViewModel] = repositories.compactMap {
            TopListRepositoriesModel.RepositoryCellViewModel(repository: $0)
        }
        
        viewController?.displayRepositories(repositoryViewModelCell)
    }
    
    func presentScreenLoading() {
        viewController?.displayScreenLoading()
    }
    
    func hideScreenLoading() {
        viewController?.hideScreenLoading()
    }
    
    func presentPaginationLoading() {
        viewController?.displayPaginationLoading()
    }
    
    func hidePaginationLoading() {
        viewController?.hidePaginationLoading()
    }
    
    func presentError(title: String, subtitle: String) {
        viewController?.displayError(title: title, subtitle: subtitle)
    }
    
    func presentPullRequests() {
        viewController?.displayPullRequests()
    }
    
}

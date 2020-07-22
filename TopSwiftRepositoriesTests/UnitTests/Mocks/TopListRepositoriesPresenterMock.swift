//
//  TopListRepositoriesPresenterMock.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
@testable import TopSwiftRepositories

class TopListRepositoriesPresenterMock: TopListRepositoriesPresentationLogic {
  
    
    
    var presentListRepositoriesCount = 0
    var presentScreenLoadingCount = 0
    var hideScreenLoadingCount = 0
    var presentPaginationLoadingCount = 0
    var hidePaginantionLoadingCount = 0
    var presentErrorCount = 0
    
    
    func presentListRepositories(repositories: [TopListRepositoriesModel.Repository]?) {
        presentListRepositoriesCount = presentListRepositoriesCount + 1
    }
    
    func presentScreenLoading() {
        presentScreenLoadingCount = presentScreenLoadingCount + 1
    }
    
    func presentPullRequests() {
          
    }
    
    func hideScreenLoading() {
        hideScreenLoadingCount = hideScreenLoadingCount + 1
    }
    
    func presentPaginationLoading() {
        presentPaginationLoadingCount = presentPaginationLoadingCount + 1
    }
    
    func hidePaginationLoading() {
        hidePaginantionLoadingCount = hidePaginantionLoadingCount + 1
    }
    
    func presentError(title: String, subtitle: String) {
        presentErrorCount = presentErrorCount + 1
    }
}

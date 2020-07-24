//
//  ListPullRequestPresenterMock.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 23/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
@testable import TopSwiftRepositories

class ListPullRequestPresenterMock: ListPullRequestPresentationLogic {
   
    var presentScreenLoadingCount: Int = 0
    var hideScreenLoadingCount: Int = 0
    var presentErrorCount: Int = 0
    var presentPullRequestsCount: Int = 0
    
    func presentScreenLoading() {
        presentScreenLoadingCount = presentScreenLoadingCount + 1
    }
    
    func hideScreenLoading() {
        hideScreenLoadingCount = hideScreenLoadingCount + 1
    }
    
    func presentError(title: String, subtitle: String) {
        presentErrorCount = presentErrorCount + 1
    }
    
    func presentPullRequests(pullRequests: ListPullRequest.Response) {
        presentPullRequestsCount = presentPullRequestsCount + 1
    }
    
}

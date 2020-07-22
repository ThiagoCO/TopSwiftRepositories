//
//  TopListRepositoriesRouter.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 21/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

@objc protocol TopListRepositoriesRoutingLogic {
    func routeToPullRequestList()
}

protocol TopListRepositoriesDataPassing {
    var dataStore: ListRepositoriesDataStore? { get }
}

class TopListRepositoriesRouter: NSObject, TopListRepositoriesRoutingLogic, TopListRepositoriesDataPassing {
    weak var viewController: TopListRepositoriesViewController?
    var dataStore: ListRepositoriesDataStore?
    
    func routeToPullRequestList() {
        let destinationVC = ListPullRequestViewController()
        destinationVC.setup()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToPullRequests(source: dataStore!, destination: &destinationDS)
        viewController?.present(BaseNavigationController(rootViewController: destinationVC), animated: true, completion: nil)
    }
    
    private func passDataToPullRequests(source: ListRepositoriesDataStore, destination: inout ListPullRequestDataStore) {
        destination.selectedRepository = source.selectedItem
    }
}

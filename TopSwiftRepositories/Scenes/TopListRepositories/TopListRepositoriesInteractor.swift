//
//  TopListRepositoriesInteractor.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

protocol ListRepositoriesBusinessLogic {
    
}

protocol ListRepositoriesDataStore {
    
}

class TopListRepositoriesInteractor: ListRepositoriesDataStore {
    var presenter: TopListRepositoriesPresentationLogic?
    var worker: TopListRepositoriesNetworkLogic
    var repositoryList: TopListRepositoriesModel.Response?
    
    init(worker: TopListRepositoriesNetworkLogic = TopListRepositoriesWorker()) {
        self.worker = worker
    }
    
    
}

extension TopListRepositoriesInteractor: ListRepositoriesBusinessLogic {
    

}

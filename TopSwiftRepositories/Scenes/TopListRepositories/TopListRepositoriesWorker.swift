//
//  TopListRepositoryWorker.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import PromiseKit

protocol TopListRepositoriesNetworkLogic {
    func searchRepositories(page: Int) -> Promise<TopListRepositoriesModel.Response>
}

class TopListRepositoriesWorker: TopListRepositoriesNetworkLogic {

    let networkProvider = NetworkProvider.shared
    
    func searchRepositories(page: Int) -> Promise<TopListRepositoriesModel.Response> {
        let requestProvider: TopRepositoriesProvider =  TopRepositoriesProvider(page: page)
        return networkProvider.request(requestProvider, parseAs: TopListRepositoriesModel.Response.self)
    }
    
}

//
//  TopListRepositoriesWorkerMock.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import PromiseKit
@testable import TopSwiftRepositories

enum ResultType {
    case error
    case success
}


class TopListRepositoriesWorkerMock: TopListRepositoriesNetworkLogic {
    
    var resultType: ResultType = .success
    
    func searchRepositories(page: Int) -> Promise<TopListRepositoriesModel.Response> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: TopListRepositoriesModel.Response = helper.read(filename: "repositories-stars-page-\(page)") {
                return Promise{ seal in
                    seal.fulfill(response)
                }
            }
        case .error:
            return Promise { seal in seal.reject(NetworkError.notFound) }
        }
        
        return Promise { seal in seal.reject(NetworkError.mappingError) }
    }
    
}

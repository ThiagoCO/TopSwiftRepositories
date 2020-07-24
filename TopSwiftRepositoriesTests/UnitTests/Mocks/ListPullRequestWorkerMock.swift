//
//  ListPullRequestWorkerMock.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 23/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import PromiseKit
@testable import TopSwiftRepositories

class ListPullRequestWorkerMock: ListPullRequestNetworkLogic {
    
    var resultType: ResultType = .success
    
    func getPullsRequests(request: ListPullRequest.Request) -> Promise<[ListPullRequest.PullRequest]> {
        switch resultType {
        case .success:
            let helper = JSONReaderHelper()
            if let response: [ListPullRequest.PullRequest] = helper.read(filename: "pull-requests") {
                return Promise{ seal in
                    seal.fulfill(response)
                }
            }
        case .error:
            return Promise { seal in seal.reject(NetworkError.notFound) }
            
        case .empty:
            let response: [ListPullRequest.PullRequest] = []
            return Promise{ seal in
                seal.fulfill(response)
            }
        }
        
        return Promise { seal in seal.reject(NetworkError.mappingError) }
    }
    
    
}

//
//  ListPullRequestProvider.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante De Oliveira on 21/07/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation


class ListPullRequestProvider: RequestProviderProtocol {
    var path: String
    var queryItems: [URLQueryItem]
    
    init(request: ListPullRequest.Request) {
        path = "/repos/\(request.author)/\(request.repository)/pulls"
        queryItems = []
    }

}

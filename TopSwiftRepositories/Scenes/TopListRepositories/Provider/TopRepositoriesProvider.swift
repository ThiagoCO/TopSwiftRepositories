//
//  TopRepositoriesProvider.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

class TopRepositoriesProvider: RequestProviderProtocol {
    var path: String 
    
    var queryItems: [URLQueryItem]
    
    init(page: Int) {
        path = "/search/repositories"
        queryItems = [
               URLQueryItem(name: "q", value: "language:swift"),
               URLQueryItem(name: "sort", value: "stars"),
               URLQueryItem(name: "per_page", value: "30"),
               URLQueryItem(name: "page", value: "\(page)")
           ]
    }

}

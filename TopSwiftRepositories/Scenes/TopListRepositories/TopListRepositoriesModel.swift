//
//  Repository.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

struct TopListRepositoriesModel {
    
    struct Response: Codable {
        
        let repositories: [Repository]?
        
        enum CodingKeys: String, CodingKey {
            case repositories = "items"
        }
        
    }
    
    struct Repository: Codable {
        var name: String
        var stargazersCount: Int
        var owner: Owner
    }
    
    struct Owner: Codable {
        var login: String
        var avatarUrl: String
    }
}



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
        
        var repositories: [Repository]?
        
        enum CodingKeys: String, CodingKey {
            case repositories = "items"
        }
        
    }
    
    struct Repository: Codable {
        var name: String
        var stargazersCount: Int
        let description: String
        let forksCount: Int
        var owner: Owner
    }
    
    struct Owner: Codable {
        var login: String
        var avatarUrl: String
    }
    
    struct RepositoryCellViewModel {
        var name: String
        var stargazersCount: Int
        var login: String
        var avatarUrl: String
        var forksCount: Int
        var description: String
        
        init(repository: Repository) {
            self.name = repository.name
            self.stargazersCount = repository.stargazersCount
            self.login = repository.owner.login
            self.avatarUrl = repository.owner.avatarUrl
            self.forksCount = repository.forksCount
            self.description = repository.description
        }
    }
}



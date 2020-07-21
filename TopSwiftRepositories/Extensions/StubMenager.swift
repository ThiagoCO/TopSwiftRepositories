//
//  StubMenager.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import OHHTTPStubs
@testable import TopSwiftRepositories

class StubManager {
    
    static let shared = StubManager()
    
    func stubRequests(withDelay delay: TimeInterval) {
        
        stub(condition: isHost("api.github.com") && containsQueryParams(["page": "1"])) { request -> HTTPStubsResponse in
            
            let result: TopListRepositoriesModel.Response? = JSONReaderHelper().read(filename: "repositories-stars-page-1")
            return HTTPStubsResponse(data: result.toData() ?? Data(), statusCode: 200, headers: nil).responseTime(delay)
        }
        
        stub(condition: isHost("api.github.com") && containsQueryParams(["page": "2"])) { request -> HTTPStubsResponse in
            
            let result: TopListRepositoriesModel.Response? = JSONReaderHelper().read(filename: "repositories-stars-page-2")
            return HTTPStubsResponse(data: result.toData() ?? Data(), statusCode: 200, headers: nil).responseTime(delay)
        }
        
        stub(condition: isHost("api.github.com") && containsQueryParams(["page": "3"])) { request -> HTTPStubsResponse in
            
            let result: TopListRepositoriesModel.Response? = JSONReaderHelper().read(filename: "repositories-stars-page-2")
            return HTTPStubsResponse(data: result.toData() ?? Data(), statusCode: 400, headers: nil).responseTime(delay)
        }
    }
    
}

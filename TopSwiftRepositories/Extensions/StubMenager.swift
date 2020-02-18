//
//  StubMenager.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import OHHTTPStubs

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
        
        stub(condition: !isHost("api.github.com")) { request -> HTTPStubsResponse in
            
            print("STUB URL: \(request.url?.absoluteString)")
            
            guard let urlStr = request.url else { return HTTPStubsResponse(data: Data(), statusCode: 404, headers: nil) }
            if urlStr.absoluteString.contains("avatars2.githubusercontent.com") {

                let img = #imageLiteral(resourceName: "github_logo_placeholder")
                return HTTPStubsResponse(data: img.pngData() ?? Data(), statusCode: 200, headers: nil)
            }
            return HTTPStubsResponse(data: Data(), statusCode: 404, headers: nil)
            
        }
        
    }
    
}

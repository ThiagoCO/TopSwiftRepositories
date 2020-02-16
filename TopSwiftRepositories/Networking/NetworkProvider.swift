//
//  NetworkProvider.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 15/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation
import PromiseKit

struct NetworkProvider {
    
    private init() { }
    
    static let shared = NetworkProvider()
    
    func request<T: Codable>(_ requestProvider: RequestProviderProtocol, parseAs object: T.Type) -> Promise<T> {
        return Promise { seal in
            guard let url = requestProvider.url else { return seal.reject(NetworkError.badUrl) }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return seal.reject(NetworkError.emptyResponseDataError) }
                
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                
                if 200...299 ~= statusCode {
                  
                    if let parsedObj = data.parse(asObject: T.self, usingKeyDecodingStrategy: .convertFromSnakeCase) {
                        seal.fulfill(parsedObj)
                    } else {
                        seal.reject(NetworkError.mappingError)
                    }
                    
                    
                }
                
                return seal.reject(self.parseErrorFor(statusCode: statusCode))
            }.resume()
        }
    }

    fileprivate func parseErrorFor(statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        default:
            return .unknownError
        }
    }
}

extension Data {
      func parse<T: Decodable>(asObject model: T.Type, usingKeyDecodingStrategy strategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T? {
          do {
              let decoder = JSONDecoder()
              decoder.keyDecodingStrategy = strategy
              let resp = try decoder.decode(T.self, from: self)
              return resp
          } catch {
              print("Error: \(#function) - \(error)")
              return nil
          }
      }
  }

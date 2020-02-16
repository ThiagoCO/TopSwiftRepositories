//
//  Data+Util.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 16/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

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

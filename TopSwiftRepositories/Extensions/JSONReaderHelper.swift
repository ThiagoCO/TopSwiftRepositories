//
//  JSONReaderHelper.swift
//  TopSwiftRepositoriesTests
//
//  Created by Thiago Cavalcante De Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

class JSONReaderHelper {
    
    func read<T: Decodable>(filename: String) -> T? {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let result = data.parse(asObject: T.self, usingKeyDecodingStrategy: .convertFromSnakeCase)
                return result
            } catch {
                return nil
            }
        }
        return nil
    }
    
}

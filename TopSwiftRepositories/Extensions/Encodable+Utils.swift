//
//  Encodable+Utils.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante de Oliveira on 17/02/20.
//  Copyright © 2020 Thiago Cavalcante De Oliveira. All rights reserved.
//

import Foundation

extension Encodable {
    func toData() -> Data? {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(self)
            return jsonData
        }
        catch {
            return nil
        }
    }
}

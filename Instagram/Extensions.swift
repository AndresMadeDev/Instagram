//
//  Extensions.swift
//  Instagram
//
//  Created by Andres Made on 3/13/20.
//  Copyright © 2020 Andres Made. All rights reserved.
//

import Foundation

extension Encodable{
    func toDictionay() throws -> [String: Any]{
        let data = try JSONEncoder().encode(self)
        guard let dictionay = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionay
    }
}

extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}

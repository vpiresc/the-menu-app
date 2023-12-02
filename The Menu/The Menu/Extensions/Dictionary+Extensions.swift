//
//  Dictionary+Extensions.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation

extension Dictionary {
    func decode<T: Decodable>() -> T? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}

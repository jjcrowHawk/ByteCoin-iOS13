//
//  DataExtensions.swift
//  ByteCoin
//
//  Created by Macbook Pro on 13/4/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

extension Data {
    func toJSON<T: Decodable> () -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let result = try jsonDecoder.decode(T.self, from: self)
            return result
        } catch {
            return nil
        }
    }
}

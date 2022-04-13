//
//  GetRatesResponse.swift
//  ByteCoin
//
//  Created by Macbook Pro on 12/4/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct GetRatesResponse: Codable {
    let asset_id_base: String
    let rates: [Rates]
}

struct Rates: Codable {
    let updatedAt: String
    let currency: String
    let rate: Double
    
    enum CodingKeys: String, CodingKey {
        case currency = "asset_id_quote"
        case updatedAt = "time"
        case rate = "rate"
    }
}

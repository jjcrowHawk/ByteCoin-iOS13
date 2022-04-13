//
//  RateResponse.swift
//  ByteCoin
//
//  Created by Macbook Pro on 13/4/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct RateResponse: Codable {
    let time: String
    let baseCurrency: String
    let currency: String
    let rate: Double
    
    
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case baseCurrency = "asset_id_base"
        case currency = "asset_id_quote"
        case rate = "rate"
    }
}

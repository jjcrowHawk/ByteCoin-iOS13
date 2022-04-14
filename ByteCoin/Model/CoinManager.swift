//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinHandlerDelegate {
    func handleRatesResponse(response: GetRatesResponse?, error: Error?)
    func handleGetRateResponse(response: RateResponse?, error: Error?)
}

struct CoinManager {
    
    var delegate: CoinHandlerDelegate?
    
    private let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    private let apiKey = "27EB469F-2C58-4112-AAF6-398B4B2A0538"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getRates() {
        let urlString = "\(baseURL)?invert=false"
        
        print(urlString)
        if let url = URL(string: urlString) {
            
            let request = getRequest(url: url)
            
            URLSession.shared
                .dataTask(with: request) { data, url, error in
                    if error != nil {
                        delegate?.handleRatesResponse(response: nil, error: error)
                    }
                    
                    if let responseData = data {
                        handleGetRatesResponse(responseData)
                    }
                }
                .resume()
        }
        
    }
    
    func getCurrencyRate(currency: String){
        let urlString = "\(baseURL)/\(currency)"
        
        print(urlString)

        if let url = URL(string: urlString) {
            
            let request = getRequest(url: url)
            
            URLSession.shared
                .dataTask(with: request) { data, url, error in
                    if error != nil {
                        delegate?.handleGetRateResponse(response: nil, error: error)
                    }
                    
                    if let responseData = data {
                        handleGetCurrencyRateResponse(responseData)
                    }
                }
                .resume()
        }
    }
    
    
    // USING LONG NORMAL WAY
    func handleGetRatesResponse(_ response: Data) {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(GetRatesResponse.self, from: response)
            delegate?.handleRatesResponse(response: result, error: nil)
        } catch let error {
            delegate?.handleRatesResponse(response: nil, error: error)
        }
    }
    
    // USING DATA EXTENSION
    func handleGetCurrencyRateResponse(_ response: Data) {
        let result: RateResponse? = response.toJSON()
        delegate?.handleGetRateResponse(response: result, error: nil)
    }
    
    private func getRequest(url: URL) -> URLRequest{
        var request = URLRequest(url: url)
        
        request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")
        
        return request
    }
}

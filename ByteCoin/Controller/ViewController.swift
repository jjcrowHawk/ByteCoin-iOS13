//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - OUTLETS
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    // MARK: - PROPS
    
    var rates: [Rates] = []
    var coinManager: CoinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        
        coinManager.getRates()
    }


}


// MARK: - EXTENSIONS

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
}

extension ViewController: CoinHandlerDelegate {
    func handleGetRateResponse(response: RateResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        guard let ratesResponse = response else {
            return
        }
        
        print("data has come succesfully")
        print(ratesResponse)
    }
    
    func handleRatesResponse(response: GetRatesResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        guard let ratesResponse = response else {
            return
        }
        
        print("data has come succesfully")
        print(ratesResponse)

    }
    
    
}

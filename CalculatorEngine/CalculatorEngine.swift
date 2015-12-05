//
//  CalculatorEngine.swift
//  Retro Calculator
//
//  Created by Felix Barros on 12/5/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class CalculatorEngine {
    
    var enteredNumberString: String = ""
    
    var enteredNumber: Double {
        get {
            if let number = Double(enteredNumberString) {
                return number
            } else {
                return Double.NaN
            }
        }
    }
    
    func press(digit: Int) {
        enteredNumberString = enteredNumberString + String(digit)
    }
}

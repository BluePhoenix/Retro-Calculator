//
//  CalculatorEngine.swift
//  Retro Calculator
//
//  Created by Felix Barros on 12/5/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import Foundation

class CalculatorEngine {
    
    private var enteredNumberString: String = ""
    private var leftValue: Double = 0.0
    private var lastOperation: String = ""
    private var enteredValueIsAResult: Bool = false
    
    var enteredNumber: Double {
        get {
            if let number = Double(enteredNumberString) {
                return number
            } else if enteredNumberString == "" || enteredNumberString == "." {
                return 0
            } else {
                return Double.NaN
            }
        }
    }
    
    // MARK: Methods
    func clear() {
        enteredNumberString = ""
        enteredValueIsAResult = false
    }
    
    func press(digit: Int) {
        if enteredValueIsAResult {
            leftValue = enteredNumber
            enteredNumberString = String(digit)
            enteredValueIsAResult = false
        } else {
            enteredNumberString = enteredNumberString + String(digit)
        }
    }
    
    func pressDecimal() {
        // Check that no decimal has been entered yet
        if !enteredNumberString.containsString(".") {
            // If there isn't append it
            enteredNumberString = enteredNumberString + "."
        }
    }
    
    // MARK: Operations
    func add() {
        pushOperator("+")
        enteredValueIsAResult = true
    }
    
    func subtract() {
        pushOperator("-")
        enteredValueIsAResult = true
    }
    
    func multiply() {
        pushOperator("*")
        enteredValueIsAResult = true
    }
    
    func divide() {
        pushOperator("/")
        enteredValueIsAResult = true
    }
    
    func showResult() {
        switch lastOperation {
        case "+":
            let rightValue = enteredNumber
            let totalValue = leftValue + rightValue
            enteredNumberString = String(totalValue)
            enteredValueIsAResult = true
            
            break
        case "-":
            let rightValue = enteredNumber
            let totalValue = leftValue - rightValue
            enteredNumberString = String(totalValue)
            enteredValueIsAResult = true
            
            break
        case "*":
            let rightValue = enteredNumber
            let totalValue = leftValue * rightValue
            enteredNumberString = String(totalValue)
            enteredValueIsAResult = true
            
            break
        case "/":
            let rightValue = enteredNumber
            let totalValue = leftValue / rightValue
            enteredNumberString = String(totalValue)
            enteredValueIsAResult = true
            
            break
        default:
            break
            // Do nothing
        }
    }
    
    // MARK: Helper functions
    func pushOperator(operation: String) {
        lastOperation = operation
    }
}

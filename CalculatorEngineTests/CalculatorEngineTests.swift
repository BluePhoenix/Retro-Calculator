//
//  CalculatorEngineTests.swift
//  Retro Calculator
//
//  Created by Felix Barros on 12/5/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest
@testable import Retro_Calculator

class CalculatorEngineTests: XCTestCase {
    
    var calculator: CalculatorEngine!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = CalculatorEngine()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNoDigitsEntered() {
        XCTAssertEqual(calculator.enteredNumber, 0)
    }

    func testDigitPressed() {
        calculator.press(4)
        calculator.press(5)
        calculator.press(3)
        
        XCTAssertEqual(calculator.enteredNumber, 453)
    }
    
    func testMoreDigitsPressed() {
        calculator.press(2)
        calculator.press(5)
        calculator.press(5)
        calculator.press(3)
        
        XCTAssertEqual(calculator.enteredNumber, 2553)
    }
    
    func testDigitsWithDecimal() {
        calculator.press(5)
        calculator.pressDecimal()
        calculator.press(3)
        calculator.press(5)
        
        XCTAssertEqual(calculator.enteredNumber, 5.35)
    }
    
    func testDigitsWithDecimalNoLeadingZero() {
        calculator.pressDecimal()
        calculator.press(3)
        calculator.press(5)
        
        XCTAssertEqual(calculator.enteredNumber, 0.35)
    }
    
    func testDigitsWithMultipleDecimals() {
        calculator.pressDecimal()
        calculator.press(3)
        calculator.pressDecimal()
        calculator.press(5)
        
        XCTAssertEqual(calculator.enteredNumber, 0.35)
    }
    
    // MARK: Clear function tests
    func testClearButton() {
        calculator.clear()
        
        XCTAssertEqual(calculator.enteredNumber, 0)
    }
    
    func testClearButtonAfterDigitsPressed() {
        calculator.pressDecimal()
        calculator.press(1)
        calculator.clear()
        
        XCTAssertEqual(calculator.enteredNumber, 0)
    }
    
    // MARK: Operations tests
    func testAddWithResult() {
        calculator.press(4)
        calculator.press(2)
        calculator.add()
        calculator.press(1)
        calculator.press(1)
        calculator.showResult()
        
        XCTAssertEqual(calculator.enteredNumber, 53)
        
        // TODO: This implied addition might need to modified
        calculator.press(2)
        calculator.press(0)
        calculator.showResult()
        
        XCTAssertEqual(calculator.enteredNumber, 73)
    }
    
    func testAdd() {
        calculator.press(4)
        calculator.press(2)
        calculator.add()
        calculator.press(1)
        calculator.press(1)
        calculator.showResult()
        
        XCTAssertEqual(calculator.enteredNumber, 53)
        
        calculator.add()
        calculator.press(2)
        calculator.press(0)
        calculator.showResult()
        
        XCTAssertEqual(calculator.enteredNumber, 73)
    }
    
    func testAddConsecutively() {
        calculator.press(4)
        calculator.add()
        calculator.press(4)
        
        calculator.showResult()
        XCTAssertEqual(calculator.enteredNumber, 8)
        
        calculator.showResult()
        XCTAssertEqual(calculator.enteredNumber, 12)
        
        calculator.showResult()
        XCTAssertEqual(calculator.enteredNumber, 16)
        
        calculator.showResult()
        XCTAssertEqual(calculator.enteredNumber, 20)
    }

}

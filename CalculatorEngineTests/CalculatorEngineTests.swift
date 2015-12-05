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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}

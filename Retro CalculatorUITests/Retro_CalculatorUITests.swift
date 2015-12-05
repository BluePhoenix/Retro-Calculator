//
//  Retro_CalculatorUITests.swift
//  Retro CalculatorUITests
//
//  Created by Felix Barros on 12/4/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest

class Retro_CalculatorUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDisplayLongDecimals() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        let buttonFive = app.buttons["5"]
        let buttonSix = app.buttons["6"]
        let buttonZero = app.buttons["0 double wide"]
        let decimalButton = app.buttons["period"]
        
        buttonFive.tap()
        buttonSix.tap()
        decimalButton.tap()
        buttonZero.tap()
        buttonZero.tap()
        buttonZero.tap()
        buttonZero.tap()
        buttonZero.tap()
        buttonFive.tap()
        
        XCTAssertEqual(app.staticTexts.elementBoundByIndex(0).label, "56.000005")
    }
    
}

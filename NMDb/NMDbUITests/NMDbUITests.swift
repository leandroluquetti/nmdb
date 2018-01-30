//
//  NMDbUITests.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest

class NMDbUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
    }
    
}

//
//  BaseTests.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest

class BaseTests: XCTestCase {
    
    // MARK: - Constants
    let app = XCUIApplication()
    
    // MARK: - Overrides
    
    override func setUp() {
        super.setUp()
        
        XCUIDevice.shared.orientation = .portrait
        continueAfterFailure = true
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
}

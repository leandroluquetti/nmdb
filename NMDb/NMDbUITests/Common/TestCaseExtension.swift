//
//  TestCaseExtension.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest

// MARK: - XCTestCase extension
extension XCTestCase {
    
    /// Wait an element exists to start interact with it.
    ///
    /// - Parameters:
    ///   - element: Current element
    ///   - timeout: Optional timeout. Default value is 10 seconds.
    func waitElementExists(element: XCUIElement, timeout: TimeInterval = 10) {
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: timeout, handler: nil)
    }
    
}

//
//  BaseScreen.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//


import XCTest

protocol BaseScreen {
    
    /// Wait screen be avaible for test
    ///
    /// - Parameter testCase: Current screen testCase instance
    static func waitScreen(testCase: XCTestCase)
}

extension BaseScreen {
    // MARK: - Common steps
    
    /// Tap button
    ///
    /// - Parameter identifier: button identifier
    static func tapButton(identifier: String) {
        XCUIApplication().buttons[identifier].tap()
    }
    
    /// Tap cell
    ///
    /// - Parameter identifier: cell identifier
    static func tapCell(identifier: String) {
        XCUIApplication().tables.cells.staticTexts[identifier].tap()
    }
    
    /// Tap Navigation back button
    ///
    /// - Parameter identifier: Navagation identifier
    static func tapBackButton(navigationIdentifier: String, backIdentifier: String = "Back") {
        XCUIApplication().navigationBars[navigationIdentifier].buttons[backIdentifier].tap()
    }
    
    /// Tap Navigation back button
    ///
    /// - Parameter identifier: Navagation identifier
    static func tapSegmentedControll(identifier: String, index: Int) {
        XCUIApplication().segmentedControls[identifier].buttons.element(boundBy: index).tap()
    }
}


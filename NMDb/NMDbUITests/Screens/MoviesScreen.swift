//
//  MoviesScreen.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest

class MoviesScreen: BaseScreen {
    
    static let screenIdentifier = "moviesScreen"
    static let moviesSegments = "movieSgments"
    static let movieLoadText = "Coco"
    static let movieLoadTextPopular = "The Maze Runner"
    
    /// Wait to screen to be shown
    ///
    /// - Parameter testCase: test case use to assert the screen presentation
    static func waitScreen(testCase: XCTestCase) {
        let screen = XCUIApplication().collectionViews[screenIdentifier]
        testCase.waitElementExists(element: screen)
    }
    
    /// Single tap on cell
    static func upcomingCell() -> XCUIElement {
        let collection = XCUIApplication().collectionViews[MoviesScreen.screenIdentifier]
        let cell = collection.cells.element(boundBy: 0).staticTexts[MoviesScreen.movieLoadText]
        return cell
    }
    
    /// Popular cell from collection view
    ///
    /// - Returns: elemente representing popular cell
    static func popularCell() -> XCUIElement {
        let collection = XCUIApplication().collectionViews[MoviesScreen.screenIdentifier]
        let cell = collection.cells.element(boundBy: 0).staticTexts[MoviesScreen.movieLoadTextPopular]
        return cell
    }
    
    /// Single tap on upcoming
    static func upcomingSegment() -> XCUIElement {
        let element = XCUIApplication().navigationBars.buttons.element(boundBy: 0)
        return element
    }
    
    /// Single tap on popular
    static func popularSegment() -> XCUIElement {
        let element = XCUIApplication().navigationBars.buttons.element(boundBy: 1)
        return element
    }
}

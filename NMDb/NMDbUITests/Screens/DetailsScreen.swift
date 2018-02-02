//
//  DetailsScreen.swift
//  NMDbUITests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest

class DetailsScreen: BaseScreen {
    
    static let screenIdentifier = "detailsScreen"
    static let titleLabel = "titleLabel"
    static let descriptionLabel = "descriptionLabel"
    static let bannerImage = "bannerImage"
    static let posterImage = "posterImage"
    static let creditsCollection = "CreditsCollection"
    
    /// Wait to screen to be shown
    ///
    /// - Parameter testCase: test case use to assert the screen presentation
    static func waitScreen(testCase: XCTestCase) {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        testCase.waitElementExists(element: screen)
    }
    
    /// Title Element
    ///
    /// - Returns: element representing movie title
    static func titleElement() -> XCUIElement {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        let element = screen.staticTexts[titleLabel]
        return element
    }
    
    /// Desciption Element
    ///
    /// - Returns: element representing movie Desciption
    static func descriptionElement() -> XCUIElement {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        let element = screen.staticTexts[descriptionLabel]
        return element
    }
    
    /// Banner Element
    ///
    /// - Returns: element representing movie Banner
    static func bannerElement() -> XCUIElement {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        let element = screen.images[bannerImage]
        return element
    }
    
    /// Poster Element
    ///
    /// - Returns: element representing movie Poster
    static func posterElement() -> XCUIElement {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        let element = screen.images[posterImage]
        return element
    }
    
    /// Credits Element
    ///
    /// - Returns: element representing movie Credits collection
    static func creditsElement() -> XCUIElement {
        let screen = XCUIApplication().otherElements[screenIdentifier]
        let element = screen.collectionViews[creditsCollection]
        return element
    }
    
}


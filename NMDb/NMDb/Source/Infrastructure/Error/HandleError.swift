//
//  HandleError.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit
import SwiftMessages

/**
 *  Structure responsible to handle and show error to user, both business and technical errors
 */
struct HandleError {
    // MARK: - Constants
    
    fileprivate static let kDefaultImage = "error"
    
    // MARK: - Public Functions
    
    static func handle(error: Error) {
        
        if let businessError = error as? BusinessError {
            handleBusiness(error: businessError)
        } else if let technicalError = error as? TechnicalError {
            handleTechnical(error: technicalError)
        }
    }
    
    // MARK: - Handle Error types
    
    /**
     Handle all types of BusinessError
     
     - parameter error:                BusinessError object
     - parameter navigationController: Instance of current navigationController
     */
    fileprivate static func handleBusiness(error: BusinessError) {
        let messageError: String
        
        switch error {
        case .invalidDictionaryKey(let key):
            messageError = "\(LocalizableStrings.invalidDictionary.localize()) \(key)"
            showStatusLine(message: messageError)
            
        case .invalidValue:
            messageError = LocalizableStrings.invalidValue.localize()
            showStatusLine(message: messageError)
            
        case .parse(let message):
            messageError = "\(LocalizableStrings.errorParseData.localize()) - (\(message))"
            showStatusLine(message: messageError)
            
        case .offlineMode:
            messageError = LocalizableStrings.offlineMode.localize()
            showStatusLine(message: messageError, durantion: 1)
        }
    }
    
    /**
     Handle all types of TechnicalError
     
     - parameter error:                TechnicalError object
     - parameter navigationController: Instance of current navigationController
     */
    fileprivate static func handleTechnical(error: TechnicalError) {
        let errorTitle = LocalizableStrings.technicalError.localize()
        
        switch error {
        case .httpError(let code):
            let messageError = "\(LocalizableStrings.httpError.localize()) \(code)"
            showDefault(title: errorTitle, description: messageError)
            
        case .invalidURL:
            let messageError = LocalizableStrings.invalidURL.localize()
            showDefault(title: errorTitle, description: messageError)

        case .notFound:
            let messageError = LocalizableStrings.notFound.localize()
            showDefault(title: errorTitle, description: messageError)
            
        case .parse(let message):
            let messageError = "\(LocalizableStrings.errorOnParseRequest.localize()) - (\(message))"
            print("Error: \(messageError)")
            showStatusLine(message: errorTitle, durantion: 1)
            
        case .requestError:
            let messageError = LocalizableStrings.errorOnRequest.localize()
            showDefault(title: errorTitle, description: messageError)
        }
    }
    
    // MARK: - Present Error types
    
    fileprivate static func showDefault(title: String, description: String) {
        // View setup
        let view = MessageView.viewFromNib(layout: .messageView)
        
        view.configureContent(title: title,
                              body: description,
                              iconImage: nil,
                              iconText: nil,
                              buttonImage: nil,
                              buttonTitle: "Hide",
                              buttonTapHandler: { _ in SwiftMessages.hide() })
        
        view.configureTheme(.info, iconStyle: .default)
        
        // Config setup
        var config = SwiftMessages.Config()
        
        config.presentationContext = .window(windowLevel: UIWindowLevelNormal)
        config.duration = .forever
        config.dimMode = .gray(interactive: true)
        config.preferredStatusBarStyle = .lightContent
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
    
    fileprivate static func showStatusLine(message: String, durantion: TimeInterval = 3) {
        // View setup
        let view = MessageView.viewFromNib(layout: .statusLine)
        
        view.configureContent(body: message)
        view.configureTheme(.info, iconStyle: .light)
        
        // Config setup
        var config = SwiftMessages.Config()
        
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.duration = .seconds(seconds: durantion)
        config.dimMode = .gray(interactive: true)
        config.preferredStatusBarStyle = .lightContent
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
}

//
//  LocalizableStrings.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

enum LocalizableStrings: String {
    
    // Strings
    case mainTitle
    case upcomingMovies
    case popularMovies
    
    // Error Handling
    case genericError
    case fatalError
    case unexpectedError
    case businessError
    case technicalError
    case invalidDictionary
    case invalidValue
    case errorParseData
    case errorOnRequest
    case invalidURL
    case notFound
    case httpError
    case errorOnParseRequest
    case offlineMode
    case apiAccess
    
    /// This method localizes the raw value of the object
    ///
    /// - Returns: Return the localized string for that key
    func localize() -> String {
        return self.rawValue.localize()
    }

}

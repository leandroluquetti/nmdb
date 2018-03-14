//
//  Environment.swift
//  NMDb
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

enum Environment {
    case debug
    case mock
    case release
    
    static func current() -> Environment {
        #if MOCK
            return Environment.mock
        #elseif DEBUG
            return Environment.debug
        #else
            return Environment.release
        #endif
    }
}

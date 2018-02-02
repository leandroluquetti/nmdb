//
//  BusinessError.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

enum BusinessError: Error {
    case parse(String)
    case invalidValue
    case offlineMode
}

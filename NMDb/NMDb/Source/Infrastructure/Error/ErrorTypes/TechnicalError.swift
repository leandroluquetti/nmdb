//
//  TechnicalError.swift
//  NMDb
//
//  Created by Gian Nucci on 29/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

enum TechnicalError: Error {
    case parse(String)
    case httpError(Int)
    case requestError
    case invalidURL
    case notFound
}

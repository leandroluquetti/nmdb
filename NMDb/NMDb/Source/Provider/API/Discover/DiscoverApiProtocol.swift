//
//  DiscoverApiProtocol.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

typealias DiscoverCallback = (() throws -> Data?) -> Void

protocol DiscoverApiProtocol {
    
    func discoverMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping DiscoverCallback)
}

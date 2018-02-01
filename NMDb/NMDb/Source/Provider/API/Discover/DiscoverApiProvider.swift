//
//  DiscoverApiProvider.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

class DiscoverApiProvider: DiscoverApiProtocol {
    
    private let endpoint = "/discover/movie"
    
    func discoverMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping DiscoverCallback) {
        
        _ = ApiProvider.sharedProvider.GET(endpoint,
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
}

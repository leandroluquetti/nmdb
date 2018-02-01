//
//  MovieApiProvider.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

class MovieApiProvider: MovieApiProtocol {
    
    private let discoverEndpoint = "/discover/movie"
    private let movieEndpoint = "/movie/"
    
    func discoverMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping MovieCallback) {
        
        _ = ApiProvider.sharedProvider.GET(discoverEndpoint,
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
    
    func fetchMovie(withParameters parameters: NetworkParameters,
                    movieId: String,
                    _ completion: @escaping MovieCallback) {
        _ = ApiProvider.sharedProvider.GET("\(movieEndpoint)\(movieId)",
                                           parameters: parameters,
                                           header: nil,
                                           completion: { (result) in
            completion {
                return try result()
            }
        })
    }
        
}

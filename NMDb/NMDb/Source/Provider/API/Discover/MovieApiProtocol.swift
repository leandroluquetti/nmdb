//
//  MovieApiProtocol.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

typealias  MovieCallback = (() throws -> Data?) -> Void

protocol MovieApiProtocol {
    
    func discoverMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping MovieCallback)
    
    func fetchMovie(withParameters parameters: NetworkParameters,
                    movieId: String,
                    _ completion: @escaping MovieCallback)
    
}

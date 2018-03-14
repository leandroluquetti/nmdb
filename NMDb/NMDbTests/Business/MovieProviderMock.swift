//
//  MovieProviderMock.swift
//  NMDbTests
//
//  Created by Gian Nucci on 02/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import XCTest
@testable import NMDb

class MovieProviderMock: BaseMock, MovieApiProtocol {
    
    func upcomingMovies(withParameters parameters: NetworkParameters,
                        _ completion: @escaping MovieCallback) {
        completion { try loadResponse() }
    }
    
    func popularMovies(withParameters parameters: NetworkParameters,
                       _ completion: @escaping MovieCallback) {
        completion { try loadResponse() }
    }
    
    func movie(withParameters parameters: NetworkParameters, movieId: String,
               _ completion: @escaping MovieCallback) {
        completion { try loadResponse() }
    }
    
    func credits(withParameters parameters: NetworkParameters, movieId: String,
                 _ completion: @escaping MovieCallback) {
        completion { try loadResponse() }
    }
}

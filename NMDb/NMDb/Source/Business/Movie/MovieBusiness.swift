//
//  MovieBusiness.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import Foundation

typealias MovieDiscoverUICallback = (@escaping () throws -> MovieDiscover?) -> Void
typealias MovieUICallback = (@escaping () throws -> Movie?) -> Void

class MovieBusiness {

    private var provider: MovieApiProtocol
    
    private var discover: MovieDiscover?
    
    init(withProvider aProvider: MovieApiProtocol = MovieApiProvider()) {
        self.provider = aProvider
    }
    
    func discoverMovies(refresh: Bool = false,
                        _ completion: @escaping MovieDiscoverUICallback) {
        
        do {
            var discoverRequest = DiscoverRequest()
            if let currentDiscover = self.discover {
                let currentPage: Int = currentDiscover.page ?? 0
                let lastPage: Int = currentDiscover.totalPages ?? Int.max
                if currentPage >= lastPage {
                    completion { currentDiscover }
                    return
                }
                
                discoverRequest.page = currentPage + 1
            }
            
            discoverRequest.primaryReleaseGreaterThan = currentDateString()
            
            let request = try JSONEncoder().encode(discoverRequest)
            let parameters: NetworkParameters = (nil, request)
            provider.discoverMovies(withParameters: parameters, { [weak self] ( result ) in
                do {
                    
                    guard let _self = self else {
                        return
                    }
                    
                    guard let discoverResult = try result() else {
                        throw BusinessError.parse("Could not parse response: DiscoverMovies")
                    }
                    
                    guard let discover = try? JSONDecoder().decode(MovieDiscover.self, from: discoverResult) else {
                        throw BusinessError.parse("Could not parse response: DiscoverMovies")
                    }
                    
                    if _self.discover == nil {
                        _self.discover = discover
                    } else {
                        _self.append(movieDiscover: discover)
                    }
                    
                    completion { _self.discover }
                    
                } catch let error {
                    completion { throw error }
                }
            })
            
        } catch {
            completion {
                throw BusinessError.parse("Error parsing request parameters: DiscoverRequest")
            }
        }
    }
    
    func fetchMovie(identifier: Int,
                    _ completion: @escaping MovieUICallback) {
        do {
            let movieRequest = MovieRequest()
            let request = try JSONEncoder().encode(movieRequest)
            let parameters: NetworkParameters = (nil, request)
            
            provider.fetchMovie(withParameters: parameters,
                                movieId: String(identifier), { (result) in
                do {
                    guard let movieResult = try result() else {
                        throw BusinessError.parse("Could not parse response: FetchMovies")
                    }
                    
                    guard let movie = try? JSONDecoder().decode(Movie.self, from: movieResult) else {
                        throw BusinessError.parse("Could not parse response: FetchMovies")
                    }
                    
                    completion { movie }
                    
                } catch {
                    completion { throw error }
                }
            })
        } catch {
            completion {
                throw BusinessError.parse("Error parsing request parameters: MovieRequest")
            }
        }
    }
    
    private func append(movieDiscover newDiscover: MovieDiscover) {
        guard var discover = self.discover else { return }
        
        discover.page = newDiscover.page
        if let results = newDiscover.results {
            discover.results?.append(contentsOf: results)
        }
        
        self.discover = discover
    }
    
    private func currentDateString() -> String {
    
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let stringDate = formatter.string(from: Date())
        
        return stringDate
    }
}

//
//  DetailsManager.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

class DetailsManager: BaseManager {
    
    /// Movie Business
    private lazy var business: MovieBusiness = {
        return MovieBusiness()
    }()
    
    func fetchMovie(identifier: Int,
                    _ completion: @escaping MovieUICallback) {
        addOperation {
            self.business.fetchMovie(identifier: identifier, { (movie) in
                OperationQueue.main.addOperation {
                    completion(movie)
                }
            })
        }
    }
}

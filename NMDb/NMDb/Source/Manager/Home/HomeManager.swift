//
//  HomeManager.swift
//  NMDb
//
//  Created by Gian Nucci on 31/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

class HomeManager: BaseManager {

    /// Movie Business
    private lazy var business: MovieBusiness = {
        return MovieBusiness()
    }()
    
    func discoverMovies(refresh: Bool = false,
                        _ completion: @escaping MovieDiscoverUICallback) {
        addOperation {
            self.business.discoverMovies(refresh: refresh, { (discover) in
                OperationQueue.main.addOperation {
                    completion(discover)
                }
            })
        }
    }
}

//
//  DetailsViewController.swift
//  NMDb
//
//  Created by Gian Nucci on 01/02/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit
import ElasticTransition

class DetailsViewController: ElasticModalViewController, Identifiable, ViewCustomizable {
    
    typealias CustomView = DetailsView
    
    private lazy var manager = {
        return DetailsManager()
    }()
    
    var movieId: Int?
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMovie()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func loadMovie() {
        guard let movieId = self.movieId else {
            showError()
            return
        }
        customView.showLoading(true)
        manager.fetchMovie(identifier: movieId) { [weak self] (result) in
            guard let _self = self else { return }
            
            do {
                guard let movie = try result() else {
                    throw BusinessError.invalidValue
                }
                _self.movie = movie
                _self.fillScreen()
            } catch {
                HandleError.handle(error: error)
            }
        }
    }

    private func fillScreen() {
        guard let movie = self.movie else { return }
        self.customView.fillScreen(movie: movie)
    }
    
    private func showError() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == CreditsCollectionViewController.segueIdentifier {
            guard let creditsViewController = segue.destination as? CreditsCollectionViewController else { return }
            creditsViewController.movieId = self.movieId
        }
    }

}

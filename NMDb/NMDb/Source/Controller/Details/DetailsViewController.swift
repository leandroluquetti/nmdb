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
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

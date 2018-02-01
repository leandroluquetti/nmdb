//
//  HomeCollectionViewController.swift
//  NMDb
//
//  Created by Gian Nucci on 30/01/18.
//  Copyright © 2018 nucci. All rights reserved.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController, Identifiable {

    private var movies: [Movie]? {
        didSet {
            if movies != nil {
                collectionView?.reloadData()
            }
        }
    }
    
    private lazy var manager = {
        return HomeManager()
    }()
    
    private var selectedMovieId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadMovies()
    }
    
    fileprivate func loadMovies() {
        manager.discoverMovies { [weak self] (result) in
            guard let _self = self else { return }
            
            do {
                guard let discover = try result() else { return }
                _self.movies = discover.results
                
            } catch {
                HandleError.handle(error: error)
            }
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == DetailsViewController.segueIdentifier {
            guard let detailsViewController = segue.destination as? DetailsViewController else { return }
            detailsViewController.movieId = self.selectedMovieId
        }
    }

}

// MARK: - UICollectionViewDataSource && UICollectionViewDelegate
extension HomeCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MovieCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let movie = movies?[indexPath.row] else { return cell }
        cell.setup(title: movie.title!, url: movie.posterPath, release: movie.releaseDate)
        
        if indexPath.row >= (movies?.count ?? 0)-1 {
            loadMovies()
        }

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didEndDisplaying cell: UICollectionViewCell,
                                 forItemAt indexPath: IndexPath) {
        guard let movieCell = cell as? MovieCollectionViewCell else { return }
        movieCell.posterImage.kf.cancelDownloadTask()
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        guard let movie = movies?[indexPath.row] else { return }
        selectedMovieId = movie.identifier
        performSegue(withIdentifier: DetailsViewController.segueIdentifier,
                     sender: self)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin = 10
        
        var width = (UIScreen.main.bounds.width - CGFloat(2*margin))/3
        
        if UIDevice.current.orientation.isLandscape {
            width = (UIScreen.main.bounds.width - CGFloat(4*margin))/5
        }
        
        let size = CGSize(width: width,
                          height: (width*1.41) + 30)
        
        return size
    }
}

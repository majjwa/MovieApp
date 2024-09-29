//
//  PopularViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class PopularViewController: UIViewController {
    @IBOutlet weak var PopularCV: UICollectionView!
    var popularVM: PopularViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let repository = NetworkMoviesRepository()
        let fetchPopularMoviesUseCase = FetchPopularMoviesUseCase(repository: repository)
        popularVM = PopularViewModel(fetchPopularMoviesUseCase: fetchPopularMoviesUseCase)
        setupCollectionView()
        self.navigationController?.isNavigationBarHidden = true
        PopularCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        fetchPopularMovies()
    }
    
    func setupCollectionView() {
        PopularCV.delegate = self
        PopularCV.dataSource = self
        PopularCV.RegisterNib(cell: MoviesCollectionViewCell.self)
    }
    
    private func fetchPopularMovies() {
        popularVM?.getPopularMovies{ [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.PopularCV.reloadData()
                if let message = errorMessage {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
}

//
//  UpComingMoviesViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class UpComingMoviesViewController: UIViewController {
    var upComingVM: UpComingViewModel?
    @IBOutlet weak var upComingCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        let repository = NetworkMoviesRepository()
        let useCase = FetchUpComingMoviesUseCase(repository: repository)
        upComingVM = UpComingViewModel(useCase: useCase)
        self.navigationController?.isNavigationBarHidden = true
        upComingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        fetchUpComingMovies()

    }
    
    func setupCollectionView() {
        upComingCV.delegate = self
        upComingCV.dataSource = self
        upComingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }
    private func fetchUpComingMovies() {
        upComingVM?.getUpComingMovies{ [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.upComingCV.reloadData()
                if let message = errorMessage {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
   
}

//  NowPlayingViewController.swift
//  banquemisr.challenge05
//
//  Created by marwa maky on 27/09/2024.
//

import UIKit

class NowPlayingViewController: UIViewController {
    @IBOutlet weak var nowPlayingCV: UICollectionView!
    var nowPlayingVM: NowPlayingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let repository = NetworkMoviesRepository()
        let useCase = FetchNowPlayingMoviesUseCase(repository: repository)
        nowPlayingVM = NowPlayingViewModel(useCase: useCase)
        self.navigationController?.isNavigationBarHidden = true
        nowPlayingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        setupCollectionView()
        fetchNowPlayingMovies()
    }
   
    func setupCollectionView() {
        nowPlayingCV.delegate = self
        nowPlayingCV.dataSource = self
        nowPlayingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
    }

    private func fetchNowPlayingMovies() {
        nowPlayingVM?.getNowPlayingMovies { [weak self] errorMessage in
            DispatchQueue.main.async {
                self?.nowPlayingCV.reloadData()
                
                if let message = errorMessage {
                    self?.showAlert(title: "Error", message: message)
                }
            }
        }
    }
}

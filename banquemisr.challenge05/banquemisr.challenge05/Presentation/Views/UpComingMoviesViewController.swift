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
        upComingVM = UpComingViewModel()
        setupCollectionView()
        setupErrorHandling()

        self.navigationController?.isNavigationBarHidden = true
        upComingCV.collectionViewLayout = UICollectionViewFlowLayout.createStandardFlowLayout()
        upComingVM?.getUpComingMovies {
            self.upComingCV.reloadData()
        }
    }
    func setupErrorHandling() {
        upComingVM?.onError = { [weak self] errorMessage in
               self?.showAlert(title: "Error", message: errorMessage)
           }
       }
    func setupCollectionView() {
        upComingCV.delegate = self
        upComingCV.dataSource = self
        upComingCV.RegisterNib(cell: MoviesCollectionViewCell.self)
       }

   
}
